//
//  ContactAction.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/7/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

public extension Voting.Components.Contact {
	enum Action {
		case request(Request)
		case event(Event)
	}
}

// MARK: -
public extension Voting.Components.Contact.Action {
	enum Request {
		case composeEmail
		case callNumber
	}

	enum Event {
		case composeFinished
		case callFinished
	}
}
