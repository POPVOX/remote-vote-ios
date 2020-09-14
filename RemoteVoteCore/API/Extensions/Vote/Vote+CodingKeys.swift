//
//  Vote+CodingKeys.swift
//  RemoteVoteCore
//
//  Created by Jordan Kay on 9/22/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

extension Vote {
	enum CodingKeys: String, CodingKey {
		case id
		case groupID = "groupId"
		case title
		case subtitle
		case heading
		case subheading
		case instructions
		case choices = "buttons"
		case type
		case contactInfo = "contactData"
		case totalMinutes
		case startTime
		case endTime
		case record = "userVote"
	}
}
