//
//  Login+Effect.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/2/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import ComposableArchitecture

extension Login {
	typealias Effect = ComposableArchitecture.Effect<Action, Never>

	static func authenticationEffect(in environment: Environment, forEmail email: String) -> Effect {
		environment.api
			.authenticate(withEmail: email)
			.publisher(on: .main)
			.catchToEffect()
			.map(Action.Event.authenticated)
			.map(Action.event)
	}

	static func activationEffect(in environment: Environment, forToken token: String) -> Effect {
		environment.api
			.activate(withToken: token)
			.publisher(on: .main)
			.retry(1)
			.catchToEffect()
			.map(Action.Event.activated)
			.map(Action.event)
	}
}
