//
//  Voting+Reducer.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/9/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

import ComposableArchitecture

extension Voting {
	typealias Reducer = ComposableArchitecture.Reducer<State, Action, Environment>

	static let reducer = Reducer.combine(
		headerReducer,
		timerReducer,
		componentsReducer,
		votingReducer
	)
}

// MARK: -
private extension Voting {
	static let votingReducer = Reducer { state, action, environment in
		switch action {
		case .request(.subscribe):
			return pushEffect(in: environment)
		case .request(.fetchActiveVote):
			state.$voteStatus.indicateFetching()
			fallthrough
		case .event(.voteLaunched(.success)):
			return activeVoteEffect(in: environment)
		case let .event(.activeVoteFetched(.success(vote))):
			switch state.voteStatus {
			case .none, .inactive:
				state.voteStatus = .active(vote)
				return .init(value: .timer(.request(.start)))
			default:
				break
			}
		case .event(.activeVoteFetched(.failure(.couldNotParseData))), .event(.voteEnded(.success)):
			state.voteStatus = .inactive
		case let .event(.activeVoteFetched(.failure(error))):
			state.$voteStatus.indicateFailure(with: error)
		default:
			break
		}

		return .none
	}

	static var headerReducer: Reducer {
		Header.reducer.optional.pullback(
			state: \.headerState,
			action: /Action.header,
			environment: Header.Environment.init
		)
	}

	static var timerReducer: Reducer {
		Timer.reducer.optional.pullback(
			state: \.timerState,
			action: /Action.timer,
			environment: Timer.Environment.init
		)
	}

	static var componentsReducer: Reducer {
		Components.reducer.optional.pullback(
			state: \.componentsState,
			action: /Action.components,
			environment: Components.Environment.init
		)
	}
}
