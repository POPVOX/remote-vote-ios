//
//  VoteType+Encodable.swift
//  RemoteVoteCoreTests
//
//  Created by Jordan Kay on 9/22/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

@testable import RemoteVoteCore

extension Vote.VoteType: Encodable {
	// MARK: Encodable
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(codingValue.rawValue)
	}
}

// MARK: -
private extension Vote.VoteType {
	var codingValue: CodingValue {
		switch self {
		case .singleChoice:
			return .singleChoice
		case .singleSelect:
			return .singleSelect
		}
	}
}
