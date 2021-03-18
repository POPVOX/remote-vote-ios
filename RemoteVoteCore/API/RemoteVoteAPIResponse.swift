//
//  RemoteVoteAPIResponse.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/20/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import Emissary

extension RemoteVote.API {
	struct Response<Resource>: APIResponse {
		public let data: Resource
	}
}

// MARK: -
extension RemoteVote.API.Response: Decodable where Resource: Decodable {}
