//
//  AppAction.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/1/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

public extension App {
	enum Action {
		case event(Event)
		case login(Login.Action)
		case authenticated(Main.Action)
	}
}

// MARK: -
public extension App.Action {
	typealias Result = RemoteVote.API.Result

	enum Event {
		case launchFinished
		case accessTokenUpdated(RemoteVote.API.AccessToken?)
		case userFetched(Result<User>)
		case userRetrieved(User)
	}
}
