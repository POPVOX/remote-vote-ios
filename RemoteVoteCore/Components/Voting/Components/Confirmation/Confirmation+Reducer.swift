//
//  Confirmation+Reducer.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/10/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import ComposableArchitecture

extension Voting.Components.Confirmation {
	typealias Reducer = ComposableArchitecture.Reducer<State, Action, Environment>

	static let reducer = Reducer { state, action, environment in
		switch action {
		case .request(.confirmVote):
			let choice = state.choice
			let id = state.vote.id
			let data = state.userPhotoData
			state.$record.indicateFetching()
			return voteConfirmationEffect(selecting: choice, forVoteWith: id, usingPhotoWith: data, in: environment)
		case .request(.changeVote):
			return voteChangeEffect(for: state)
		case let .event(.voteConfirmed(.success(record))):
			state.record = record
		case let .event(.voteConfirmed(.failure(error))):
			state.$record.indicateFailure(with: error)
		default:
			break
		}

		return .none
	}
}
