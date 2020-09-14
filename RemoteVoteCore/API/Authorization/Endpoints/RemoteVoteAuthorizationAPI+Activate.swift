//
//  RemoteVoteAuthorizationAPI+Activate.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/20/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import Emissary

extension RemoteVote.Authorization.API {
	func activate(withToken token: String) -> Request<RemoteVote.API.AccessToken> {
		let path = Activation.path
		let payload = Activation.Payload(token: token)
		return post(payload, to: path)
	}
}

// MARK: -
private extension RemoteVote.Authorization.API {
	enum Activation {}
}

// MARK: -
extension RemoteVote.Authorization.API.Activation: PathAccessible {
	// MARK: SubpathRepresentable
	enum PathComponents: String, PathComponent {
		case activate
	}

	static var component: PathComponents {
		.activate
	}
}

// MARK: -
private extension RemoteVote.Authorization.API.Activation {
	struct Payload {
		let token: String
	}
}

// MARK: -
extension RemoteVote.Authorization.API.Activation.Payload: Encodable {}
