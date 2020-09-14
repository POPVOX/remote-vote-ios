//
//  HeaderView.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/24/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import UIKit
import Hull
import Layoutless
import RemoteVoteCore

extension Voting.Header {
	final class View: Hull.View<State, Action> {
		private let logoView = UIImageView()
		private let bodyLabel = UILabel(style: .body)

		// MARK: View
		override func setup() {
			backgroundColor = background.color

			assign(\.logoImage.image, to: \.image, on: logoView)
			assign(\.bodyString, to: \.text, on: bodyLabel)
			assign(\.bodyTextColor.color, to: \.textColor, on: bodyLabel)
		}

		// MARK: View
		override var body: AnyLayout {
			HStack(spacing: .logo)(
				logoLayout,
				bodyLabel
			).fillingParent()
		}
	}
}

// MARK: -
private extension Voting.Header.View {
	var logoLayout: AnyLayout {
		logoView.scaledProportionally(toHeight: .logo)
	}
}

// MARK: -
private extension Style where View == UILabel {
	static let body = Self {
		$0.font = .customFont(ofSize: .body, weight: .bold)
	}.displayingContent
}

// MARK: -
private extension Height {
	static let logo: Self = 80
}

// MARK: -
private extension Spacing.Horizontal {
	static let logo: Self = -20
}

// MARK: -
private extension Size.Font {
	static let body: Self = 24
}
