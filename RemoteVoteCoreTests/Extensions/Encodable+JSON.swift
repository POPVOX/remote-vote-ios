//
//  Encodable+Encoded.swift
//  RemoteVoteCoreTests
//
//  Created by Jordan Kay on 9/21/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

@testable import RemoteVoteCore

extension Encodable {
	func toJSON() throws -> Any {
		let api = RemoteVote.API(accessToken: .mock)
		let data = try api.encoder.encode(self)
		return try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed])
	}
}
