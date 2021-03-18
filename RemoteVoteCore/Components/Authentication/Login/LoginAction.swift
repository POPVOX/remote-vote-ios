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
		case activate(token: RemoteVote.Authorization.API.Activation.Token)
	}

	enum Event {
		case emailUpdated(text: String?)
		case authenticated(Result<String>)
		case activated(Result<RemoteVote.API.AccessToken>)
	}
}
