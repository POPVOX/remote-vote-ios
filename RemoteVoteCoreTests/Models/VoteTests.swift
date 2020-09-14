//
//  VoteTests.swift
//  RemoteVoteCoreTests
//
//  Created by Jordan Kay on 9/21/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

import XCTest

@testable import RemoteVoteCore

class VoteTests: XCTestCase {}

// MARK: -
extension VoteTests {
	func testDecodingVote() throws {
		let id: Vote.ID = 81
		let groupID: Group.ID = 1
		let title = "Roll Call Vote"
		let subtitle = "On Motion to Suspend the Rules and Pass, As Amended"
		let heading = "H.R. 7010"
		let subheading = "Paycheck Protection Program Flexibility Act"
		let instructions = "Click a button below to vote on this measure"
		let choiceText = "Yea"
		let choiceColorString = "#17AB8D"
		let choiceIndex = 1
		let choiceValue = 1
		let type: Vote.VoteType = "single_select"
		let contactInfoName = "the Office of the Clerk"
		let contactInfoEmail = "someemail@house.gov"
		let contactInfoPhoneNumber = "406-789-8765"
		let totalMinutes = 10
		let startTime: Date = "2020-09-22T03:22:12+00:00"
		let endTime: Date = "2020-09-22T03:32:12+00:00"
		let recordVoteID = id
		let recordChoiceText = choiceText
		let recordChoiceValue = choiceValue

		let json: JSON = [
			"id": id,
			"group_id": groupID,
			"title": title,
			"subtitle": subtitle,
			"heading": heading,
			"subheading": subheading,
			"instructions": instructions,
			"buttons": [
				[
					"text": choiceText,
					"color": choiceColorString,
					"order": choiceIndex,
					"value": choiceValue
				]
			],
			"type": type,
			"contact_data": [
				"name": contactInfoName,
				"email": contactInfoEmail,
				"phone": contactInfoPhoneNumber
			],
			"totalMinutes": totalMinutes,
			"start_time": startTime,
			"end_time": endTime,
			"user_vote": [
				[
					"vote_id": recordVoteID,
					"text_value": recordChoiceText,
					"int_value": recordChoiceValue
				]
			]
		]

		let vote = try Vote(decoding: json)

		XCTAssertEqual(vote.id, id)
		XCTAssertEqual(vote.groupID, groupID)
		XCTAssertEqual(vote.title, title)
		XCTAssertEqual(vote.subtitle, subtitle)
		XCTAssertEqual(vote.heading, heading)
		XCTAssertEqual(vote.subheading, subheading)
		XCTAssertEqual(vote.instructions, instructions)
		XCTAssertEqual(vote.choiceText, choiceText)
		XCTAssertEqual(vote.choiceColorString, choiceColorString)
		XCTAssertEqual(vote.choiceIndex, choiceIndex)
		XCTAssertEqual(vote.choiceValue, choiceValue)
		XCTAssertEqual(vote.type, type)
		XCTAssertEqual(vote.contactInfoName, contactInfoName)
		XCTAssertEqual(vote.contactInfoEmail, contactInfoEmail)
		XCTAssertEqual(vote.contactInfoPhoneNumber, contactInfoPhoneNumber)
		XCTAssertEqual(vote.totalMinutes, totalMinutes)
		XCTAssertEqual(vote.startTime, startTime)
		XCTAssertEqual(vote.endTime, endTime)
		XCTAssertEqual(vote.recordVoteID, recordVoteID)
		XCTAssertEqual(vote.recordChoiceText, recordChoiceText)
		XCTAssertEqual(vote.recordChoiceValue, recordChoiceValue)
	}
}

// MARK: -
private extension Vote {
	var choice: Choice { choices[0] }
	var recordEntry: Record.Entry { record.entries[0] }
	var choiceText: String { choice.text }
	var choiceColorString: String { choice.colorString }
	var choiceIndex: Int { choice.index }
	var choiceValue: Int { choice.value }
	var contactInfoName: String { contactInfo.name }
	var contactInfoEmail: String { contactInfo.email }
	var contactInfoPhoneNumber: String { contactInfo.phoneNumber }
	var recordVoteID: ID { recordEntry.voteID }
	var recordChoiceText: String { recordEntry.choiceText }
	var recordChoiceValue: Int { recordEntry.choiceValue }
}
