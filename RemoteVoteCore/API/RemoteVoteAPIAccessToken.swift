//
//  RemoteVoteAPIAccessToken.swift
//  RemoteVoteCore
//
//  Created by Jordan Kay on 3/18/21.
//  Copyright © 2021 POPVOX, Inc. All rights reserved.
//  

public extension RemoteVote.API {
	struct AccessToken {
		let value: String
	}
}

// MARK: -
extension RemoteVote.API.AccessToken: Equatable {}

extension RemoteVote.API.AccessToken: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		value = try container.decode(String.self)
	}
}

extension RemoteVote.API.AccessToken: Encodable {
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(value)
	}
}
