//
//  Pusher.swift
//  RemoteVote
//
//  Created by Jordan Kay on 8/17/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

import Combine
import Emissary
import PusherSwift

extension App {
	struct Pusher {
		let connection = Connection()
		let channel: PusherChannel
	}
}

// MARK: -
extension App.Pusher {
	struct Connection {
		let client = Pusher(
			key: "2a18bb18a798d603be4b",
			options: .init(
				authMethod: .inline(secret: "83380d0846ae2622f2c3"),
				autoReconnect: false,
				host: .cluster("us2")
			)
		)
	}

	enum Event: String {
		case voteLaunched = "VoteLaunched"
		case voteEnded = "VoteEnded"
	}

	init(currentUserID: User.ID) {
		connection.client.connect()
		channel = connection.client.subscribe("private-App.Modules.Models.Group.1")
	}

	func publisher(for event: Event, on queue: DispatchQueue) -> AnyPublisher<Void, NetworkError<RemoteVote.API.Error>> {
		Future { [channel] promise in
			channel.bind(eventName: event.rawValue) { (_: Any?) in
				promise(.success(()))
			}
		}.eraseToAnyPublisher()
	}
}

// MARK: -
extension App.Pusher: Equatable {}

// MARK: -
extension App.Pusher.Connection: Equatable {}

