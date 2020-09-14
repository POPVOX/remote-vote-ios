//
//  LoginAction.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/2/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

public extension Login {
	enum Action {
		case request(Request)
		case event(Event)
		case activation(Activation.Action)
	}
}

// MARK: -
public extension Login.Action {
	typealias Result = RemoteVote.Authorization.API.Result

	enum Request {
		case authenticate
		case activate(token: String)
	}

	enum Event {
		case emailUpdated(String?)
		case activated(Result<RemoteVote.API.AccessToken>)
		case authenticated(Result<String>)
	}

	static func emailUpdatedEvent(withEmail email: String?) -> Self {
		.event(.emailUpdated(email))
	}
}
