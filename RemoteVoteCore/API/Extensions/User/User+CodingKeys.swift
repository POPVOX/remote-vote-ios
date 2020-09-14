//
//  User+CodingKeys.swift
//  RemoteVoteCore
//
//  Created by Jordan Kay on 9/22/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

extension User {
	enum CodingKeys: String, CodingKey {
		case id
		case groupID = "groupId"
		case username
		case firstName
		case lastName
		case email
		case avatarURL = "avatar"
		case phoneNumber
	}
}
