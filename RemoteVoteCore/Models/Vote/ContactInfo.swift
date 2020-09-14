//
//  ContactData.swift
//  RemoteVoteCore
//
//  Created by Jordan Kay on 9/21/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

extension Vote {
	struct ContactInfo {
		let name: String
		let email: String
		let phoneNumber: String
	}
}

// MARK: -
extension Vote.ContactInfo: Equatable {}

extension Vote.ContactInfo: Decodable {}
