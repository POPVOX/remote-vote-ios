//
//  ConfirmationView.swift
//  RemoteVote
//
//  Created by Jordan Kay on 8/4/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

import UIKit
import Hull
import Layoutless
import RemoteVoteCore

extension Voting.Components.Confirmation {
	final class View: Hull.View<State, Action> {
		private let representativeLabel = UILabel(style: .body)
		private let userPhotoView = UIImageView()
		private let voteChoiceLabel = UILabel(style: .body)
		private let voteTitleLabel = UILabel(style: .title)
		private let timestampLabel = UILabel(style: .timestamp)
		private let confirmVoteButton = Button(style: .primary)
		private let confirmVoteFooterLabel = UILabel(style: .footer)
		private let changeVoteButton = Button(style: .secondary)

		// MARK: View
		override func setup() {
			backgroundColor = background.color
			representativeLabel.text = viewStore.representative
			userPhotoView.image = UIImage(data: viewStore.userPhotoData)
			voteChoiceLabel.attributedText = viewStore.choiceString(with: choiceColorAttributes)
			voteTitleLabel.text = viewStore.voteTitle
			timestampLabel.text = timestamp
			confirmVoteFooterLabel.text = confirmVoteFooter
			changeVoteButton.title = changeVoteButtonTitle

			assign(\.canConfirmVote, to: \.isEnabled, on: confirmVoteButton)
			assign(\.confirmVoteButtonTitle, to: \.title, on: confirmVoteButton)
			assign(\.$record.isBeingFetched, to: \.showsLoadingIndicator, on: confirmVoteButton)
			handleTapping(confirmVoteButton) { .request(.confirmVote) }
			handleTapping(changeVoteButton) { .request(.changeVote) }
			showHUD(fetching: \.$record, with: [.success, .error])
		}

		// MARK: View
		override var body: AnyLayout {
			VStack(spacing: .body)(
				voteLayout,
				selectionLayout
			).fillingParent(insets: .content)
		}
	}
}

// MARK: -
private extension Voting.Components.Confirmation.View {
	var voteLayout: AnyLayout {
		VStack(alignment: .center)(
			representativeLabel,
			userPhotoContainerLayout,
			voteChoiceLabel,
			voteTitleLabel,
			timestampLabel
		)
	}

	var userPhotoContainerLayout: AnyLayout {
		UIView().addingLayout(userPhotoLayout)
	}

	var userPhotoLayout: AnyLayout {
		userPhotoView
			.sizing(toHeight: .userPhoto)
			.constrainingAspectRatio(to: 1)
			.fillingParent(verticalInsets: .default)
	}

	var selectionLayout: AnyLayout {
		VStack(spacing: .selection)(
			confirmVoteContainerLayout,
			changeVoteButton
		)
	}

	var confirmVoteContainerLayout: AnyLayout {
		VStack(
			confirmVoteButton,
			confirmVoteFooterLabel
		)
	}

	var choiceColorAttributes: [NSAttributedString.Key: UIColor] {
		[.foregroundColor: .init(hexString: viewStore.choiceColorString)]
	}
}

// MARK: -
private extension Style where View == UILabel {
	static let body = Self {
		$0.font = .customFont(ofSize: .body, weight: .bold)
	}.displayingContent

	static let timestamp = Self {
		$0.textColor = Voting.Components.Confirmation.timestampText.color
		$0.font = .customFont(ofSize: .body)
	}.displayingContent

	static let title = Self {
		$0.font = .customFont(ofSize: .title, weight: .bold)
	}.displayingContent

	static let subtitle = Self {
		$0.font = .customFont(ofSize: .primary)
	}.displayingContent

	static let footer = Self {
		$0.font = .customFont(ofSize: .secondary)
	}.displayingContent
}

// MARK: -
private extension Height {
	static let userPhoto: Self = 100
}

// MARK: -
private extension Spacing.Vertical {
	static let body: Self = 28
	static let selection: Self = 20
}

// MARK: -
private extension Size.Font {
	static let body: Self = 20
	static let title: Self = 32
}
