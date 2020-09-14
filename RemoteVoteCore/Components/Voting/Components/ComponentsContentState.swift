//
//  ComponentsContentState.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/2/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

public extension Voting.Components {
	enum Content {}
}

// MARK: -
public extension Voting.Components.Content {
	struct State {
		var step: Step
		var contactState: Voting.Components.Contact.State
	}
}

// MARK: -
extension Voting.Components.Content.State {
	enum Step {
		case selectionState(Voting.Components.Selection.State)
		case confirmationState(Voting.Components.Confirmation.State)
	}

	init(
		user: User,
		vote: Vote
	) {
		step = .selectionState(
			.init(
				user: user,
				vote: vote
			)
		)
		contactState = .init(vote: vote)
	}
}

// MARK: -
extension Voting.Components.Content.State: Equatable {}

// MARK: -
extension Voting.Components.Content.State.Step: Equatable {}
