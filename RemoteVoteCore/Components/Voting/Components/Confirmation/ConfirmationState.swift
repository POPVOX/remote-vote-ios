//
//  ConfirmationState.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/2/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

public extension Voting.Components.Confirmation {
	struct State {
		public let userPhotoData: Data

		let user: User
		let vote: Vote
		let choice: Vote.Choice

		@Fetched public internal(set) var record: Vote.Record?
	}
}

// MARK: -
public extension Voting.Components.Confirmation.State {
	var canConfirmVote: Bool {
		record == nil && !$record.isBeingFetched
	}
}

// MARK: -
extension Voting.Components.Confirmation.State: Equatable {}
