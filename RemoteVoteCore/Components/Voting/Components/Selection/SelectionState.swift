//
//  Selection+State.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/2/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import CasePaths

public extension Voting.Components.Selection {
	struct State {
		let user: User
		let vote: Vote

		var photoState: Photo.State
	}
}

// MARK: -
public extension Voting.Components.Selection.State {
	var isTakingPhoto: Bool {
		(/Voting.Components.Selection.Photo.State.taking).matches(photoState)
	}
}

// MARK: -
extension Voting.Components.Selection.State {
	init(
		user: User,
		vote: Vote
	) {
		self.user = user
		self.vote = vote
		photoState = .notYetTaken
	}
}

// MARK: -
extension Voting.Components.Selection.State: Equatable {}
