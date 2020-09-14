//
//  TimerView.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/24/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import UIKit
import Hull
import Layoutless
import RemoteVoteCore

extension Voting.Timer {
	final class View: Hull.View<State, Action> {
		private let promptLabel = UILabel(style: .prompt)
		private let bodyLabel = UILabel(style: .body)

		// MARK: View
		override func setup() {
			promptLabel.text = prompt

			assign(\.remainingTimeString, to: \.text, on: bodyLabel)
		}

		// MARK: View
		override var body: AnyLayout {
			VStack(alignment: .center)(
				promptLabel,
				bodyLabel
			).fillingParent(verticalInsets: .default)
		}
	}
}

// MARK: -
private extension Style where View == UILabel {
	static let prompt = Self {
		$0.font = .customFont(ofSize: .prompt)
	}

	static let body = Self {
		$0.textColor = Voting.Timer.text.color
		$0.font = .customFont(ofSize: .body, weight: .bold)
	}
}

// MARK: -
private extension Size.Font {
	static let prompt: Self = 20
	static let body: Self = 48
}
