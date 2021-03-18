//
//  Contact+Reducer.swift
//  RemoteVoteCore
//
//  Created by Jordan Kay on 9/17/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

import ComposableArchitecture

extension Voting.Components.Contact {
	typealias Reducer = ComposableArchitecture.Reducer<State, Action, Environment>

	static let reducer = Reducer { state, action, _ in
		switch action {
		case .request(.composeEmail):
			state.activityState = .composingEmail
		case .request(.callNumber):
			state.activityState = .callingNumber
		case .event(.composeFinished), .event(.callFinished):
			state.activityState = .idle
		}

		return .none
	}
}
