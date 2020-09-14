//
//  RemoteVoteAPI+Vote.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/24/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

import Emissary

extension RemoteVote.API {
	func fetchActiveVote() -> Request<Vote> {
		let path = Vote.path(to: .active)
		return getResource(at: path)
	}

	func castVote(selecting choice: Vote.Choice, usingPhotoWith data: Data, forVoteWith id: Vote.ID) -> Request<Vote.Record> {
		let path = Vote.path(to: .cast).appending(id)
		let payload = Vote.Cast.Payload(
			choices: [.init(index: choice.index)],
			photoData: data
		)
		return post(payload, to: path)
	}
}
