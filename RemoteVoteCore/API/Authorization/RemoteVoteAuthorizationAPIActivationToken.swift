//
//  RemoteVoteAuthorizationAPIActivationToken.swift
//  RemoteVoteCore
//
//  Created by Jordan Kay on 3/18/21.
//  Copyright © 2021 POPVOX, Inc. All rights reserved.
//  

public extension RemoteVote.Authorization.API.Activation {
	struct Token {
		let value: String

		public init(value: String) {
			self.value = value
		}
	}
}

// MARK: -
extension RemoteVote.Authorization.API.Activation.Token: Equatable {}

extension RemoteVote.Authorization.API.Activation.Token: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		value = try container.decode(String.self)
	}
}

extension RemoteVote.Authorization.API.Activation.Token: Encodable {
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(value)
	}
}
