//
//  Components+Reducer.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/10/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

import ComposableArchitecture

extension Voting.Components {
	typealias Reducer = ComposableArchitecture.Reducer<State, Action, Environment>

	static let reducer = Reducer.combine(
		selectionReducer,
		confirmationReducer,
		contactReducer,
		componentsReducer
	)
}

// MARK: -
private extension Voting.Components {
	static let componentsReducer = Reducer { state, action, _ in
		switch action {
		case let .selection(.event(.choiceSelected(confirmationState))):
			state.confirmationState = confirmationState
		case let .confirmation(.event(.voteChanged(selectionState))):
			state.selectionState = selectionState
		default:
			break
		}

		return .none
	}

	static var selectionReducer: Reducer {
		Selection.reducer.optional.pullback(
			state: \.selectionState,
			action: /Action.selection,
			environment: Selection.Environment.init
		)
	}

	static var confirmationReducer: Reducer {
		Confirmation.reducer.optional.pullback(
			state: \.confirmationState,
			action: /Action.confirmation,
			environment: Confirmation.Environment.init
		)
	}

	static var contactReducer: Reducer {
		Contact.reducer.optional.pullback(
			state: \.contactState,
			action: /Action.contact,
			environment: Contact.Environment.init
		)
	}
}
