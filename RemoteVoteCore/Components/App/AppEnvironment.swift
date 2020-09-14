//
//  AppEnvironment.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/1/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

public extension App {
	class Environment {
		let keychain = Keychain()

		var user: User? {
			didSet {
				storage?[.user] = user
				pusher = user
					.map(\.id)
					.map(Pusher.init)
			}
		}

		fileprivate var pusher: Pusher?

		public init() {}
	}
}

// MARK: -
extension App.Environment {
	var api: RemoteVote.API? {
		keychain[.accessToken]
			.map(RemoteVote.API.AccessToken.init)
			.map(RemoteVote.API.init)
	}

	var storage: App.Storage? {
		api.map(App.Storage.init)
	}
}

// MARK: -
extension Login.Environment {
	init(environment: App.Environment) {
		api = .init()
	}
}

// MARK: -
extension Main.Environment {
	init(environment: App.Environment) {
		api = environment.api!
		pusher = environment.pusher!
	}
}
