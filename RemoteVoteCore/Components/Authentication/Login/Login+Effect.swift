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

	static func authenticationEffect(in environment: Environment, using email: User.Email) -> Effect {
		environment.api
			.authenticate(with: email)
			.publisher(on: .main)
			.catchToEffect()
			.map(Action.Event.authenticated)
			.map(Action.event)
	}

	static func activationEffect(in environment: Environment, for token: RemoteVote.Authorization.API.Activation.Token) -> Effect {
		environment.api
			.activate(with: token)
			.publisher(on: .main)
			.retry(1)
			.catchToEffect()
			.map(Action.Event.activated)
			.map(Action.event)
	}
}
