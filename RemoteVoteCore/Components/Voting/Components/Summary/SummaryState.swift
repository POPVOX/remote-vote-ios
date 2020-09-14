//
//  SummaryState.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/2/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

public extension Voting.Components.Summary {
	struct State {
		public let vote: Vote?
	}
}

// MARK: -
public extension Voting.Components.Summary.State {
	var hasVote: Bool {
		vote != nil
	}
}

// MARK: -
extension Voting.Components.Summary.State: Equatable {}
