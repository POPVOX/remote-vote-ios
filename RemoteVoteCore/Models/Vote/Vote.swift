//
//  Vote.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/24/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import Identity

public struct Vote {
	public let id: ID

	let groupID: Group.ID
	let title: String
	let subtitle: String?
	let heading: String?
	let subheading: String?
	let instructions: String?
	let choices: [Choice]
	let type: VoteType
	let contactInfo: ContactInfo
	let totalMinutes: Int
	let startTime: Date
	let endTime: Date
	let record: Record
}

// MARK: -
extension Vote: Equatable {}

extension Vote: Decodable {}

extension Vote: Identifiable {
	public typealias RawIdentifier = Int
}
