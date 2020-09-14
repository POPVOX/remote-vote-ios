//
//  ConfirmationState+Presentation.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/10/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

public extension Voting.Components.Confirmation.State {
	private typealias ConfirmationStrings = Strings.Voting.Components.Confirmation
	private typealias ButtonTitleStrings = ConfirmationStrings.Title.Button

	var representative: String {
		ConfirmationStrings.representative(user.firstName, user.lastName)
	}

	var voteTitle: String {
		vote.title.uppercased()
	}

	var choiceColorString: String {
		choice.colorString
	}

	var confirmVoteButtonTitle: String {
		let string = canConfirmVote ? ButtonTitleStrings.confirmVote : ButtonTitleStrings.voteConfirmed
		return string.uppercased()
	}
}

// MARK: -
public extension Voting.Components.Confirmation.ViewStore {
	private typealias ConfirmationStrings = Strings.Voting.Components.Confirmation

	func choiceString(with colorAttributes: [NSAttributedString.Key: Any]) -> NSAttributedString {
		let choiceText = self.choice.text.uppercased()
		let string = ConfirmationStrings.choice(choiceText)
		let attributedString = NSMutableAttributedString(string: string)
		let range = (string as NSString).range(of: choiceText)
		attributedString.addAttributes(colorAttributes, range: range)
		return attributedString
	}
}
