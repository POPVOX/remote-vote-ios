//
//  Entry.swift
//  RemoteVoteCore
//
//  Created by Jordan Kay on 9/22/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

extension Vote.Record {
	struct Entry {
		let voteID: Vote.ID
		let choiceText: String
		let choiceValue: Int
	}
}

// MARK: -
extension Vote.Record.Entry: Equatable {}

extension Vote.Record.Entry: Decodable {}
