//
//  Status.swift
//  RemoteVote
//
//  Created by Jordan Kay on 8/5/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import CasePaths

public extension Vote {
	enum Status {
		case inactive
		case active(Vote)
	}
}

// MARK: -
extension Vote.Status {
	var activeVote: Vote? {
		(/Vote.Status.active).extract(from: self)
	}
}

// MARK: -
extension Vote.Status: Equatable {}
