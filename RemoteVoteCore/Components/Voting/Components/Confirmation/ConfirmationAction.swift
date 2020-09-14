//
//  ConfirmationAction.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/2/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

public extension Voting.Components.Confirmation {
	enum Action {
		case request(Request)
		case event(Event)
	}
}

// MARK: -
public extension Voting.Components.Confirmation.Action {
	typealias Result = RemoteVote.API.Result

	enum Request {
		case confirmVote
		case changeVote
	}

	enum Event {
		case voteConfirmed(Result<Vote.Record>)
		case voteChanged(Voting.Components.Selection.State)
	}
}
