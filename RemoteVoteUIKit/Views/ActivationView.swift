//
//  ActivationView.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/7/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import UIKit
import Hull
import Layoutless
import RemoteVoteCore

extension Login.Activation {
	final class View: Hull.View<State, Action> {
		private let logoView = UIImageView(style: Style.Logo.RemoteVote.inverted)
		private let promptLabel = UILabel(style: .prompt)
		private let directionsLabel = UILabel(style: .directions)
		private let explanationLabel = UILabel(style: .explanation)

		// MARK: View
		override func setup() {
			backgroundColor = background.color
			promptLabel.text = prompt
			directionsLabel.text = directions
			explanationLabel.text = explanation

			handle(UIApplication.willResignActiveNotification) { .request(.finish) }
		}

		override var body: AnyLayout {
			VStack(spacing: .logo, alignment: .center)(
				logoLayout,
				instructionsLayout
			).pinned(
				edges: [.left, .right, .top],
				relativeToSafeArea: true
			)
		}
	}
}

// MARK: -
private extension Login.Activation.View {
	var logoLayout: AnyLayout {
		logoView.scaledProportionally(toHeight: .logo)
	}

	var instructionsLayout: AnyLayout {
		VStack(spacing: .instructions)(
			promptLabel,
			directionsLabel,
			explanationLabel
		)
	}
}

// MARK: -
private extension Style where View == UILabel {
	static let prompt = Self {
		$0.textColor = Login.text.color
		$0.font = .customFont(ofSize: .prompt, weight: .semibold)
	}.displayingContent

	static let directions = Self {
		$0.textColor = Login.text.color
		$0.font = .customFont(ofSize: .detail, weight: .semibold)
	}.displayingContent

	static let explanation = Self {
		$0.textColor = Login.text.color
		$0.font = .customFont(ofSize: .detail)
	}.displayingContent
}

// MARK: -
private extension Height {
	static let logo: Self = 80
}

// MARK: -
private extension Spacing.Vertical {
	static let logo: Self = 32
	static let instructions: Self = 12
}

// MARK: -
private extension Size.Font {
	static let prompt: Self = 24
	static let detail: Self = 15
}
