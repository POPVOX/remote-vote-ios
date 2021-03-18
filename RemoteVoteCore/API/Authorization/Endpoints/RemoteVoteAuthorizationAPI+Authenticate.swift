//
//  RemoteVoteAuthorizationAPI+Authenticate.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/20/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import Emissary

extension RemoteVote.Authorization.API {
	func authenticate(with email: User.Email) -> Request<String> {
		let path = Authentication.path
		let payload = Authentication.Payload(email: email)
		return post(payload, to: path)
	}
}

// MARK: -
private extension RemoteVote.Authorization.API {
	enum Authentication {}
}

// MARK: -
extension RemoteVote.Authorization.API.Authentication: PathAccessible {
	// MARK: SubpathRepresentable
	enum PathComponents: String, PathComponent {
		case signup
	}

	static var component: PathComponents {
		.signup
	}
}

// MARK: -
private extension RemoteVote.Authorization.API.Authentication {
	struct Payload {
		let email: User.Email
	}
}

// MARK: -
extension RemoteVote.Authorization.API.Authentication.Payload: Encodable {}
