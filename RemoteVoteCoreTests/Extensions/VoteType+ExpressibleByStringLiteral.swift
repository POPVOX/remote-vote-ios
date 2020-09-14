//
//  VoteType+Encodable.swift
//  RemoteVoteCoreTests
//
//  Created by Jordan Kay on 9/22/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

@testable import RemoteVoteCore

extension Vote.VoteType: ExpressibleByStringLiteral {
	public init(stringLiteral value: StringLiteralType) {
		let api = RemoteVote.API(accessToken: .mock)
		let data = try! JSONSerialization.data(withJSONObject: value, options: .fragmentsAllowed)
		self = try! api.decoder.decode(Self.self, from: data)
	}
}
