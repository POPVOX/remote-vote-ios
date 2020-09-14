//
//  Selection+Effect.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/2/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import ComposableArchitecture

extension Voting.Components.Selection {
	typealias Effect = ComposableArchitecture.Effect<Action, Never>

	static func selectionEffect(for choice: Vote.Choice, using state: State, in environment: Environment) -> Effect {
		switch state.photoState {
		case let .taken(data):
			return .init(value:
				.event(
					.choiceSelected(
						.init(
							userPhotoData: data,
							user: state.user,
							vote: state.vote,
							choice: choice
						)
					)
				)
			)
		default:
			return .init(value: .request(.takePhoto(choice)))
		}
	}
}
