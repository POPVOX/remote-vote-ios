//
//  RemoteVoteAPI.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/20/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import Emissary

public extension RemoteVote {
	struct API {
		let accessToken: AccessToken
	}
}

// MARK: -
public extension RemoteVote.API {
	typealias Result<Resource> = Swift.Result<Resource, NetworkError<Error>>
}

// MARK: -
extension RemoteVote.API {
	typealias Request<Resource> = Emissary.Request<Response<Resource>, Self>
}

// MARK: -
extension RemoteVote.API: API {
	// MARK: API
	public var baseURL: URL {
		let url = URL(string: "https://remotevotedev.popvox.com")!
		let pathComponent = Default.component.rawValue
		return url.appendingPathComponent(pathComponent)
	}

	public var authorizationType: AuthorizationType? {
		.bearer(accessToken: accessToken.value)
	}

	public var dateFormat: String? {
		"yyyy-MM-dd'T'HH:mm:ssZ"
	}

	public var pathEncodingStrategy: PathEncodingStrategy {
		.convertToSnakeCase
	}
}

// MARK: -
private extension RemoteVote.API {
	enum Default {}
}

// MARK: -
extension RemoteVote.API.Default: PathAccessible {
	// MARK: SubpathRepresentable
	enum PathComponents: String, PathComponent {
		case api
	}

	static var component: PathComponents {
		.api
	}
}
