//
//  Record.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/8/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

public extension Vote {
	struct Record {
		let entries: [Entry]
	}
}

// MARK: -
extension Vote.Record: Equatable {}
