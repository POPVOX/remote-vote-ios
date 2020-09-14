//
//  VoteType+Decodable.swift
//  RemoteVoteCore
//
//  Created by Jordan Kay on 9/22/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

extension Vote.VoteType: Decodable {
	// MARK: Decodable
	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		let rawValue = try container.decode(String.self)
		let codingValue = CodingValue(rawValue: rawValue)

		guard let value = codingValue.map(Vote.VoteType.init) else {
			throw DecodingError.dataCorruptedError(in: container, debugDescription: rawValue)
		}

		self = value
	}
}

// MARK: -
extension Vote.VoteType {
	enum CodingValue: String {
		case singleChoice = "single_choice"
		case singleSelect = "single_select"
	}
}

// MARK: -
private extension Vote.VoteType {
	init(codingValue: CodingValue) {
		switch codingValue {
		case .singleChoice:
			self = .singleChoice
		case .singleSelect:
			self = .singleSelect
		}
	}
}
