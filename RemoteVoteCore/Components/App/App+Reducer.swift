//
//  App+Reducer.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/8/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import ComposableArchitecture

public extension App {
	typealias Reducer = ComposableArchitecture.Reducer<State, Action, Environment>

	static let reducer = Reducer.combine(
		loginReducer,
		mainReducer,
		appReducer
	)
}

// MARK: -
private extension App {
	static let appReducer = Reducer { state, action, environment in
		switch action {
		case .event(.launchFinished):
			return accessTokenEffect(in: environment)
		case .event(.accessTokenUpdated(.some)):
			return userEffect(in: environment)
		case .event(.accessTokenUpdated(.none)):
			state.loginState = .init()
		case let .event(.userRetrieved(user)),
			 let .event(.userFetched(.success(user))):
			state.mainState = .init(user: user)
			return authenticatedEffect
		case let .login(.event(event)):
			return loginEffect(for: event, in: environment)
		default:
			break
		}

		return .none
	}

	static var loginReducer: Reducer {
		Login.reducer.optional.pullback(
			state: \.loginState,
			action: /Action.login,
			environment: Login.Environment.init
		)
	}

	static var mainReducer: Reducer {
		Main.reducer.optional.pullback(
			state: \.mainState,
			action: /Action.authenticated,
			environment: Main.Environment.init
		)
	}
}
