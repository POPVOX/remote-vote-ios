//
//  User.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/20/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import Identity

public extension User {
	struct Email {
		let text: String
	}
}

// MARK: -
extension User.Email {
	var isValid: Bool {
		text.range(of: ".+@.+\\..+", options: .regularExpression) != nil
	}
}

// MARK: -
extension User.Email: Equatable {}

extension User.Email: Decodable {
	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		text = try container.decode(String.self)
	}
}

extension User.Email: Encodable {
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(text)
	}
}
