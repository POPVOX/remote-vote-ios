//
//  ContactView.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/7/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import UIKit
import Hull
import Layoutless
import ActiveLabel
import RemoteVoteCore

extension Voting.Components.Contact {
	final class View: Hull.View<State, Action> {
		private let promptLabel = UILabel(style: .prompt)
		private let bodyLabel = LinkLabel(style: .body)
		private let composer = EmailComposer()
		private let caller = Caller()

		// MARK: View
		override func setup() {
			promptLabel.text = prompt
			bodyLabel.customize { _ in
				bodyLabel.text = viewStore.body
				bodyLabel.enabledTypes = [emailLinkType, phoneNumberLinkType]
				bodyLabel.setLinkColor(viewStore.linkColor.color)
			}

			composer.subject = emailSubject
			composer.recipients = [viewStore.emailRecipient]
			caller.phoneNumber = viewStore.phoneNumber

			when(\.isComposingEmail, then: composer.compose)
			when(\.isCallingNumber, then: caller.call)
			handleTapping(emailLinkType, in: bodyLabel) { .request(.composeEmail) }
			handleTapping(phoneNumberLinkType, in: bodyLabel) { .request(.callNumber) }
			handleFinishing(composer) { _ in .event(.composeFinished) }
			handleFinishing(caller) { _ in .event(.callFinished) }
		}

		override var body: AnyLayout {
			VStack(
				promptLabel,
				bodyLabel
			).fillingParent(insets: .content)
		}
	}
}

// MARK: -
extension Voting.Components.Contact.View {
	var emailLinkType: ActiveType {
		.custom(pattern: viewStore.emailBodyLink)
	}

	var phoneNumberLinkType: ActiveType {
		.custom(pattern: viewStore.phoneNumberBodyLink)
	}
}

// MARK: -
private extension Style where View == UILabel {
	static let prompt = Self {
		$0.font = .customFont(ofSize: .primary, weight: .bold)
	}.displayingContent
}

// MARK: -
private extension Style where View == ActiveLabel {
	static let body = Self {
		$0.font = .customFont(ofSize: .primary)
	}.displayingContent
}
