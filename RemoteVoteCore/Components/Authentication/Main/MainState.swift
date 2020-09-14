//
//  MainState.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/1/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

public extension Main {
	struct State {
		public internal(set) var votingState: Voting.State
	}
}

// MARK: -
extension Main.State {
	init(user: User) {
		votingState = .init(user: user)
	}
}

// MARK: -
extension Main.State: Equatable {}
