//
//  Confirmation+Presentation.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/2/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

public extension Voting.Components.Confirmation {
	private typealias ConfirmationStrings = Strings.Voting.Components.Confirmation

	static let background = Color.Background.content
	static let timestampText = Color.Text.secondary
	static let changeVoteButtonTitle = ConfirmationStrings.Title.Button.changeVote.uppercased()
	static let confirmVoteFooter = ConfirmationStrings.Footer.confirmVote

	static var timestamp: String {
		let date = Date()
		let timeString = DateFormatter.time.string(from: date)
		let dateString = DateFormatter.date.string(from: date)
		return ConfirmationStrings.timestamp(timeString, dateString)
	}
}

// MARK: -
private extension DateFormatter {
	static let time: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "h:mm aa"
		return formatter
	}()

	static let date: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "MMMM d, YYYY"
		return formatter
	}()
}
