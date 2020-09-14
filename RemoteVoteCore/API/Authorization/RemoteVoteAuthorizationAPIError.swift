//
//  RemoteVoteAuthorizationAPIError.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/20/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import Emissary

public extension RemoteVote.Authorization.API {
	struct Error {
		let wrappedData: WrappedData
	}
}

// MARK: -
public extension RemoteVote.Authorization.API.Error {
	var message: String {
		wrappedData.response
	}
}

// MARK: -
extension RemoteVote.Authorization.API.Error {
	struct WrappedData {
		let response: String
	}
}

// MARK: -
extension RemoteVote.Authorization.API.Error: APIError {
	// MARK: APIResponse
	public var data: String {
		message
	}
}

extension RemoteVote.Authorization.API.Error: Decodable {}

// MARK: -
private extension RemoteVote.Authorization.API.Error {
	enum CodingKeys: String, CodingKey {
		case wrappedData = "data"
	}
}

// MARK: -
extension RemoteVote.Authorization.API.Error.WrappedData: Decodable {}
