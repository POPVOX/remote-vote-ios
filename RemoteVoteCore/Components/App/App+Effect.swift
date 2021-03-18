//
//  App+Effect.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/23/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

import ComposableArchitecture

extension App {
	typealias Effect = ComposableArchitecture.Effect<Action, Never>

	static func accessTokenEffect(in environment: Environment) -> Effect {
		let accessToken = environment.accessToken
		let storage = accessToken
			.map(RemoteVote.API.init)
			.map(Storage.init)

		let user: User? = storage?[.user]
		let userRemoved = (user == nil && accessToken != nil)

		return userRemoved ?
			storeEffect(storing: nil, in: environment) :
			updatedEffect(for: accessToken)
	}
	
	static func loginEffect(for event: Login.Action.Event, in environment: Environment) -> Effect {
		guard case let .activated(.success(accessToken)) = event else { return .none }
		return storeEffect(storing: accessToken, in: environment)
	}

	static func userEffect(in environment: Environment) -> Effect {
		if let user: User = environment.storage?[.user] {
			return retrievalEffect(for: user, in: environment)
		}

		return userFetchEffect(in: environment)
	}

	static var authenticatedEffect: Effect {
		.merge(
			[.subscribe, .fetchActiveVote]
				.map(Voting.Action.request)
				.map(Main.Action.voting)
				.map(App.Action.authenticated)
				.map(Effect.init)
		)
	}
}

// MARK: -
private extension App {
	static func storeEffect(storing accessToken: RemoteVote.API.AccessToken?, in environment: Environment) -> Effect {
		updatedEffect(for: accessToken)
			.handleEvents(receiveOutput: store(accessToken, in: environment))
			.eraseToEffect()
	}

	static func updatedEffect(for accessToken: RemoteVote.API.AccessToken?) -> Effect {
		.init(value: .event(.accessTokenUpdated(accessToken)))
	}

	static func userFetchEffect(in environment: Environment) -> Effect {
		environment.api!
			.fetchUser()
			.publisher(on: .main)
			.handleEvents(receiveOutput: store(in: environment))
			.catchToEffect()
			.map(Action.Event.userFetched)
			.map(Action.event)
	}

	static func retrievalEffect(for user: User, in environment: Environment) -> Effect {
		.merge(
			.init(value: .event(.userRetrieved(user))),
			.fireAndForget { environment.user = user }
		)
	}

	static func store(_ accessToken: RemoteVote.API.AccessToken?, in environment: Environment) -> (Action) -> Void {
		{ _ in
			environment.accessToken = accessToken
		}
	}

	static func store(in environment: Environment) -> (User) -> Void {
		{ user in
			environment.user = user
		}
	}
}

// MARK: -
private extension App.Environment {
	var accessToken: RemoteVote.API.AccessToken? {
		get { keychain[.accessToken].map(RemoteVote.API.AccessToken.init) }
		set { keychain[.accessToken] = newValue?.value }
	}
}
