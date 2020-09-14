//
//  Confirmation+Effect.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/2/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import ComposableArchitecture

extension Voting.Components.Confirmation {
	typealias Effect = ComposableArchitecture.Effect<Action, Never>

	static func voteConfirmationEffect(selecting choice: Vote.Choice, forVoteWith id: Vote.ID, usingPhotoWith data: Data, in environment: Environment) -> Effect {
		environment.api
			.castVote(selecting: choice, usingPhotoWith: data, forVoteWith: id)
			.publisher(on: .main)
			.catchToEffect()
			.map(Action.Event.voteConfirmed)
			.map(Action.event)
	}


	static func voteChangeEffect(for state: State) -> Effect {
		.init(
			value: .event(
				.voteChanged(
					.init(
						user: state.user,
						vote: state.vote
					)
				)
			)
		)
	}
}
