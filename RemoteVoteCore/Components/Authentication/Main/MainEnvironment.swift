//
//  MainEnvironment.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/1/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

extension Main {
	struct Environment {
		let api: RemoteVote.API
		let pusher: App.Pusher
	}
}

// MARK: -
extension Voting.Environment {
	init(environment: Main.Environment) {
		api = environment.api
		pusher = environment.pusher
	}
}
