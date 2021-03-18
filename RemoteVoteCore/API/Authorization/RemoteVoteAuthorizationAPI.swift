//
//  RemoteVoteAuthorizationAPI.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/20/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import Emissary

public extension RemoteVote.Authorization {
	struct API {}
}

// MARK: -
public extension RemoteVote.Authorization.API {
	typealias Result<Resource> = Swift.Result<Resource, Emissary.NetworkError<Error>>
}

// MARK: -
extension RemoteVote.Authorization.API {
	typealias Request<Resource> = Emissary.Request<Response<Resource>, Self>
}

// MARK: -
extension RemoteVote.Authorization.API: API {
	// MARK: API
	public var baseURL: URL {
		URL(string: "https://remotevotedev.popvox.com")!
	}
}
