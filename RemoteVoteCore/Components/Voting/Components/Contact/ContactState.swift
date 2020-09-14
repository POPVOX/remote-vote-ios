//
//  ContactState.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/7/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import CasePaths

public extension Voting.Components.Contact {
	struct State {
		let vote: Vote

		var activityState: Activity.State
	}
}

// MARK: -
public extension Voting.Components.Contact.State {
	var isComposingEmail: Bool {
		(/Voting.Components.Contact.Activity.State.composingEmail).matches(activityState)
	}

	var isCallingNumber: Bool {
		(/Voting.Components.Contact.Activity.State.callingNumber).matches(activityState)
	}
}

// MARK: -
extension Voting.Components.Contact.State {
	init(vote: Vote) {
		self.vote = vote
		activityState = .idle
	}
}

// MARK: -
extension Voting.Components.Contact.State: Equatable {}
