//
//  HeaderState.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/1/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

public extension Voting.Header {
	struct State {
		let voteStatus: Vote.Status
	}
}

// MARK: -
extension Voting.Header.State: Equatable {}
