//
//  RemoteVoteAuthorizationAPI+Activate.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/20/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import Emissary

extension RemoteVote.Authorization.API {
	func activate(with token: Activation.Token) -> Request<RemoteVote.API.AccessToken> {
		let path = Activation.path
		let payload = Activation.Payload(token: token)
		return post(payload, to: path)
	}
}

// MARK: -
extension RemoteVote.Authorization.API.Activation: PathAccessible {
	// MARK: SubpathRepresentable
	public enum PathComponents: String, PathComponent {
		case activate
	}

	public static var component: PathComponents {
		.activate
	}
}

// MARK: -
private extension RemoteVote.Authorization.API.Activation {
	struct Payload {
		let token: Token
	}
}

// MARK: -
extension RemoteVote.Authorization.API.Activation.Payload: Encodable {}
