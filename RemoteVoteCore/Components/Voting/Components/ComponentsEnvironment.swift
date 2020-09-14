//
//  ComponentsEnvironment.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/2/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

extension Voting.Components {
	struct Environment {
		let api: RemoteVote.API
	}
}

// MARK: -
extension Voting.Components.Selection.Environment {
	init(environment: Voting.Components.Environment) {}
}

// MARK: -
extension Voting.Components.Confirmation.Environment {
	init(environment: Voting.Components.Environment) {
		api = environment.api
	}
}

// MARK: -
extension Voting.Components.Contact.Environment {
	init(environment: Voting.Components.Environment) {}
}
