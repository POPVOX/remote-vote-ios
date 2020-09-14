//
//  ContactInfo+CodingKeys.swift
//  RemoteVoteCore
//
//  Created by Jordan Kay on 9/22/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

extension Vote.ContactInfo {
	enum CodingKeys: String, CodingKey {
		case name
		case email
		case phoneNumber = "phone"
	}
}
