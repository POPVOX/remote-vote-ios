//
//  Choice.swift
//  RemoteVote
//
//  Created by Jordan Kay on 8/5/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

public extension Vote {
	struct Choice {
		let text: String
		let index: Int
		let value: Int
		let colorString: String
	}
}

// MARK: -
extension Vote.Choice: Equatable {}

extension Vote.Choice: Decodable {}
