//
//  UserTests.swift
//  Elevator
//
//  Created by Jordan Kay on 5/7/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import XCTest

@testable import RemoteVoteCore

class UserTests: XCTestCase {}

// MARK: -
extension UserTests {
	func testDecodingUser() throws {
		let id: User.ID = 24
		let groupID: Group.ID = 1
		let username = "brian_babin"
		let firstName = "Brian"
		let lastName = "Babin"
		let email: User.Email = "brian.babin@mail.house.gov"
		let avatarURL: URL = "https://s3.amazonaws.com/static.popvox.com/remote-vote/avatars/user_10.jpg"
		let phoneNumber = "543-453-3454"

		let json: JSON = [
			"id": id,
			"group_id": groupID,
			"username": username,
			"first_name": firstName,
			"last_name": lastName,
			"email": email,
			"avatar": avatarURL,
			"phone_number": phoneNumber
		]

		let user = try User(decoding: json)

		XCTAssertEqual(user.id, id)
		XCTAssertEqual(user.groupID, groupID)
		XCTAssertEqual(user.username, username)
		XCTAssertEqual(user.firstName, firstName)
		XCTAssertEqual(user.lastName, lastName)
		XCTAssertEqual(user.email, email)
		XCTAssertEqual(user.avatarURL, avatarURL)
		XCTAssertEqual(user.phoneNumber, phoneNumber)
	}
}
