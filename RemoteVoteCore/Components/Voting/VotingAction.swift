//
//  VotingAction.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/1/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

public extension Voting {
	enum Action {
		case request(Request)
		case event(Event)
		case header(Header.Action)
		case timer(Timer.Action)
		case components(Components.Action)
	}
}

// MARK: -
public extension Voting.Action {
	typealias Result = RemoteVote.API.Result

	enum Request {
		case subscribe
		case fetchActiveVote
	}

	enum Event {
		case activeVoteFetched(Result<Vote>)
		case voteLaunched(Result<Void>)
		case voteEnded(Result<Void>)
	}
}
