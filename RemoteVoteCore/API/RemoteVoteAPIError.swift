//
//  RemoteVoteAPIError.swift
//  RemoteVote
//
//  Created by Jordan Kay on 5/8/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import Emissary

public extension RemoteVote.API {
	struct Error {
		public let message: String
	}
}

// MARK: -
extension RemoteVote.API.Error: Equatable {}

extension RemoteVote.API.Error: APIError {
	// MARK: API
	public var data: String {
		message
	}
}
