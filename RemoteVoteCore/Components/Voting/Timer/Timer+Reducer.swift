//
//  Timer+Reducer.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/10/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

import ComposableArchitecture

extension Voting.Timer {
	typealias Reducer = ComposableArchitecture.Reducer<State, Action, Environment>

	static let reducer = Reducer { state, action, environment in
		switch action {
		case .request(.start):
			return countdownEffect(in: environment)
		case .event(.momentPassed):
			state.updateRemainingTime()
		}

		return .none
	}
}
