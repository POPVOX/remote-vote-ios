//
//  RemoteVoteAuthorizationAPIResponse.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/20/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import Emissary

public extension RemoteVote.Authorization.API {
	struct Response<Resource> {
		let wrappedData: WrappedData<Resource>
	}
}

// MARK: -
extension RemoteVote.Authorization.API.Response {
	struct WrappedData<Resource> {
		let response: Resource
	}
}

// MARK: -
extension RemoteVote.Authorization.API.Response: APIResponse {
	// MARK: APIResponse
	public var data: Resource {
		wrappedData.response
	}
}

extension RemoteVote.Authorization.API.Response: Decodable where Resource: Decodable {}

// MARK: -
private extension RemoteVote.Authorization.API.Response {
	enum CodingKeys: String, CodingKey {
		case wrappedData = "data"
	}
}

// MARK: -
extension RemoteVote.Authorization.API.Response.WrappedData: Decodable where Resource: Decodable {}
