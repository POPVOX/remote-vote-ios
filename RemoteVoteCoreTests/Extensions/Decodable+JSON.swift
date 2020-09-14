//
//  Decodable+Create.swift
//  RemoteVoteCoreTests
//
//  Created by Jordan Kay on 9/21/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

@testable import RemoteVoteCore

extension Decodable {
	init(decoding json: JSON) throws {
		let api = RemoteVote.API(accessToken: .mock)
		let jsonObject = try json.encoded()
		let data = try JSONSerialization.data(withJSONObject: jsonObject, options: [])
		self = try api.decoder.decode(Self.self, from: data)
	}
}
