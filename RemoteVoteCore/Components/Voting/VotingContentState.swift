//
//  VotingContentState.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/3/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

public extension Voting {
	enum Content {}
}

// MARK: -
public extension Voting.Content {
	struct State {
		public var headerState: Voting.Header.State
		public var timerState: Voting.Timer.State
		public var componentsState: Voting.Components.State
	}
}

// MARK: -
extension Voting.Content.State {
	init(
		user: User,
		voteStatus: Vote.Status
	) {
		headerState = .init(voteStatus: voteStatus)
		timerState = .init(voteStatus: voteStatus)
		componentsState = .init(
			user: user,
			voteStatus: voteStatus
		)
	}
}

// MARK: -
extension Voting.Content.State: Equatable {}
