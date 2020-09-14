//
//  Voting+Effect.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/1/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

import ComposableArchitecture

extension Voting {
	typealias Effect = ComposableArchitecture.Effect<Action, Never>

	static func activeVoteEffect(in environment: Environment) -> Effect {
		environment.api
			.fetchActiveVote()
			.publisher(on: .main)
			.catchToEffect()
			.map(Action.Event.activeVoteFetched)
			.map(Action.event)
	}

	static func pushEffect(in environment: Environment) -> Effect {
		let voteLaunchedEffect = environment.pusher
			.publisher(for: .voteLaunched, on: .main)
			.catchToEffect()
			.map(Action.Event.voteLaunched)
			.map(Action.event)

		let voteEndedEffect = environment.pusher
			.publisher(for: .voteEnded, on: .main)
			.catchToEffect()
			.map(Action.Event.voteEnded)
			.map(Action.event)

		return .merge(voteLaunchedEffect, voteEndedEffect)
	}
}
