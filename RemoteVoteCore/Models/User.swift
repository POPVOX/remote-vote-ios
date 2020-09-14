//
//  User.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/20/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import Identity

public struct User {
	public let id: ID

	let groupID: Group.ID
	let username: String
	let firstName: String
	let lastName: String
	let email: String
	let avatarURL: URL?
	let phoneNumber: String
}

// MARK: -
extension User: Equatable {}

extension User: Encodable {}

extension User: Identifiable {
	public typealias RawIdentifier = Int
}
