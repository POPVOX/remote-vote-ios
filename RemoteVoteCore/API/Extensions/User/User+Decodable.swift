//
//  User+Decodable.swift
//  RemoteVoteCore
//
//  Created by Jordan Kay on 9/22/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

extension User: Decodable {
	// MARK: Decodable
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		id = try container.decode(ID.self, forKey: .id)
		groupID = try container.decode(Group.ID.self, forKey: .groupID)
		username = try container.decode(String.self, forKey: .username)
		firstName = try container.decode(String.self, forKey: .firstName)
		lastName = try container.decode(String.self, forKey: .lastName)
		email = try container.decode(Email.self, forKey: .email)
		avatarURL = try? container.decode(URL.self, forKey: .avatarURL)
		phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
	}
}
