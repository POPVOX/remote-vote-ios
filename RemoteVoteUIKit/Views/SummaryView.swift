//
//  SummaryView.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/24/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

import UIKit
import Hull
import Layoutless
import RemoteVoteCore

extension Voting.Components.Summary {
	final class View: Hull.View<State, Action> {
		private let titleLabel = UILabel(style: .body)
		private let subtitleLabel = UILabel(style: .subtitle)
		private let headingLabel = UILabel(style: .heading)
		private let subheadingLabel = UILabel(style: .subheading)
		private let emptyStateLabel = UILabel(style: .emptyState)

		// MARK: View
		override func setup() {
			backgroundColor =  background.color
			emptyStateLabel.text = emptyState

			assign(\.title, to: \.text, on: titleLabel)
			assign(\.subtitle, to: \.text, on: subtitleLabel)
			assign(\.heading, to: \.text, on: headingLabel)
			assign(\.subheading, to: \.text, on: subheadingLabel)
			dependLayout(on: \.vote)
		}

		// MARK: View
		override var body: AnyLayout {
			viewStore.hasVote ? voteLayout : emptyStateLayout
		}
	}
}

// MARK: -
private extension Voting.Components.Summary.View {
	var voteLayout: AnyLayout {
		VStack(spacing: .body)(
			upperLayout,
			lowerLayout
		).fillingParent(insets: .content)
	}

	var upperLayout: AnyLayout {
		layout(for: titleLabel, subtitleLabel)
	}

	var lowerLayout: AnyLayout {
		layout(for: headingLabel, subheadingLabel)
	}

	var emptyStateLayout: AnyLayout {
		emptyStateLabel
			.settingCompressionResistance(.required, axis: .vertical)
			.fillingParent(insets: .content)
	}
}

// MARK: -
private extension Style where View == UILabel {
	static let body = Self {
		$0.font = .customFont(ofSize: .body, weight: .bold)
	}.displayingContent

	static let subtitle = Self {
		$0.font = .customFont(ofSize: .primary)
	}.displayingContent

	static let emptyState = Self {
		$0.font = .customFont(ofSize: .primary, weight: .bold)
	}.displayingContent
}

// MARK: -
private extension Spacing.Vertical {
	static let body: Self = 32
}

// MARK: -
private extension Size.Font {
	static let body: Self = 32
}
