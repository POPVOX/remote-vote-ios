//
//  Components+State.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/2/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import CasePaths

public extension Voting.Components {
	struct State {
		public let summaryState: Summary.State
		
		public var contentState: Content.State?
	}
}

// MARK: -
public extension Voting.Components.State {
	typealias ContentState = Voting.Components.Content.State
	typealias SelectionState = Voting.Components.Selection.State
	typealias ConfirmationState = Voting.Components.Confirmation.State
	typealias ContactState = Voting.Components.Contact.State

	var selectionState: SelectionState? {
		get {
			(contentState?.step)
				.flatMap((/ContentState.Step.selectionState).extract)
		}
		set {
			newValue
				.map(ContentState.Step.selectionState)
				.map { contentState?.step = $0 }
		}
	}

	var confirmationState: ConfirmationState? {
		get {
			(contentState?.step)
				.flatMap((/ContentState.Step.confirmationState).extract)
		}
		set {
			newValue
				.map(ContentState.Step.confirmationState)
				.map { contentState?.step = $0 }
		}
	}

	var contactState: ContactState? {
		get { contentState?.contactState }
		set { newValue.map { contentState?.contactState = $0 } }
	}

	var showsSummary: Bool {
		contentState.map { _ in selectionState != nil } ?? true
	}
}

// MARK: -
extension Voting.Components.State {
	init(
		user: User,
		voteStatus: Vote.Status
	) {
		let vote = voteStatus.activeVote
		summaryState = .init(vote: vote)
		contentState = vote
			.map { (user, $0) }
			.map(ContentState.init)
	}
}

// MARK: -
extension Voting.Components.State: Equatable {}
