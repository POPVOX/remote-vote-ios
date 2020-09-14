//
//  Main+Reducer.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/8/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import ComposableArchitecture

extension Main {
	typealias Reducer = ComposableArchitecture.Reducer<State, Action, Environment>

	static let reducer = votingReducer
}

// MARK: -
private extension Main {
	static var votingReducer: Reducer {
		Voting.reducer.pullback(
			state: \.votingState,
			action: /Action.voting,
			environment: Voting.Environment.init
		)
	}
}
