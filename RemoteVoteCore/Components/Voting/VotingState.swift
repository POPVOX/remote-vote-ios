//
//  VotingState.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/1/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

public extension Voting {
	@dynamicMemberLookup struct State {
		private let user: User

		private var contentState: Content.State?

		@Fetched public internal(set) var voteStatus: Vote.Status? {
			didSet {
				contentState = voteStatus
					.map { (user, $0) }
					.map(Content.State.init)
			}
		}
	}
}

// MARK: -
extension Voting.State {
	init(user: User) {
		self.user = user
	}

	public subscript<Value>(dynamicMember keyPath: WritableKeyPath<Voting.Content.State, Value>) -> Value? {
		get { contentState?[keyPath: keyPath] }
		set { newValue.map { contentState?[keyPath: keyPath] = $0 } }
	}
}

// MARK: -
extension Voting.State: Equatable {}
