//
//  ContactState+Presentation.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/10/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

public extension Voting.Components.Contact.State {
	private typealias ContactStrings = Strings.Voting.Components.Contact
	
	var body: String {
		ContactStrings.body(
			name,
			emailBodyLink,
			phoneNumberBodyLink,
			phoneNumber
		)
	}

	var emailRecipient: String {
		contactInfo.email
	}

	var emailBodyLink: String {
		ContactStrings.Link.Body.email
	}

	var phoneNumber: String {
		contactInfo.phoneNumber
	}

	var phoneNumberBodyLink: String {
		ContactStrings.Link.Body.phone
	}

	var linkColor: ColorAsset {
		Color.Text.link
	}
}

// MARK: -
private extension Voting.Components.Contact.State {
	var contactInfo: Vote.ContactInfo {
		vote.contactInfo
	}

	var name: String {
		contactInfo.name
	}
}
