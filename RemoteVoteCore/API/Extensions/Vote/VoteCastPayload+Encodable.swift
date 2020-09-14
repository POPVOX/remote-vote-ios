//
//  VoteCastPayload+Encodable.swift
//  RemoteVoteCore
//
//  Created by Jordan Kay on 9/22/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

extension Vote.Cast.Payload: Encodable {
	// MARK: Encodable
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: EncodingKeys.self)
		try container.encode(choices, forKey: .choices)
		try container.encodeIfPresent(photoData.base64EncodedString(), forKey: .photo)
	}
}

// MARK: -
private extension Vote.Cast.Payload {
	enum EncodingKeys: String, CodingKey {
		case choices = "votes"
		case photo
	}
}
