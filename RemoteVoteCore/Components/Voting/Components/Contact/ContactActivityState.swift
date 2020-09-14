//
//  ContactActivityState.swift
//  RemoteVoteCore
//
//  Created by Jordan Kay on 9/18/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

extension Voting.Components.Contact {
	enum Activity {}
}

// MARK: -
extension Voting.Components.Contact.Activity {
	enum State {
		case idle
		case composingEmail
		case callingNumber
	}
}

// MARK: -
extension Voting.Components.Contact.Activity.State: Equatable {}
