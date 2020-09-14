//
//  Selection+Reducer.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/10/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

import ComposableArchitecture

extension Voting.Components.Selection {
	typealias Reducer = ComposableArchitecture.Reducer<State, Action, Environment>

	static let reducer = Reducer { state, action, environment in
		switch action {
		case let .request(.select(choice: choice)):
			return selectionEffect(for: choice, using: state, in: environment)
		case let .request(.takePhoto(choice)):
			state.photoState = .taking(choice)
		case let .event(.photoSaved(data)):
			guard case let .taking(choice) = state.photoState else { return .none }
			state.photoState = .taken(data)
			return selectionEffect(for: choice, using: state, in: environment)
		case .event(.photoCanceled):
			state.photoState = .notYetTaken
		default:
			break
		}

		return .none
	}
}

