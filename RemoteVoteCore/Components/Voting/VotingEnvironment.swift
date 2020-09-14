//
//  VotingEnvironment.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/1/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

extension Voting {
	struct Environment {
		let api: RemoteVote.API
		let pusher: App.Pusher
	}
}

// MARK: -
extension Voting.Header.Environment {
	init(environment: Voting.Environment) {}
}

// MARK: -
extension Voting.Timer.Environment {
	init(environment: Voting.Environment) {}
}

// MARK: -
extension Voting.Components.Environment {
	init(environment: Voting.Environment) {
		api = environment.api
	}
}
