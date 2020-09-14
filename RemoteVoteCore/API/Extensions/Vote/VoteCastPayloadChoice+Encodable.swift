//
//  VoteCastPayloadChoice+Encodable.swift
//  RemoteVoteCore
//
//  Created by Jordan Kay on 9/22/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

extension Vote.Cast.Payload.Choice: Encodable {
	// MARK: Encodable
	func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: EncodingKeys.self)
		try container.encode("\(index)", forKey: .index)
	}
}

// MARK: -
private extension Vote.Cast.Payload.Choice {
	enum EncodingKeys: String, CodingKey {
		case index = "intValue"
	}
}
