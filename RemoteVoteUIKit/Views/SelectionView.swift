//
//  SelectionView.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/24/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

import UIKit
import Hull
import Layoutless
import DynamicColor
import RemoteVoteCore

extension Voting.Components.Selection {
	final class View: Hull.View<State, Action> {
		private let instructionsLabel = UILabel(style: .instructions)
		private let imagePicker = ImagePicker(
			configuration: .selfie,
			resizingWidth: Width.compressedPhoto
		)

		private var buttons: [Button] = []

		// MARK: View
		override func setup() {
			backgroundColor = background.color
			
			instructionsLabel.text = viewStore.voteInstructions
			buttons = viewStore.voteChoices.map { choice, colorString in
				let button = Button()
				button.title = choice.selectionTitle
				button.backgroundColor = .init(hexString: colorString)
				handleTapping(button) { .request(.select(choice)) }
				return button
			}

			when(\.isTakingPhoto, then: imagePicker.showCamera)
			handleFinishing(imagePicker) { .event(.photoSaved($0)) }
			handleCanceling(imagePicker) { .event(.photoCanceled) }
		}

		// MARK: View
		override var body: AnyLayout {
			VStack(spacing: .body)(
				instructionsContainerLayout,
				buttonContainerLayout
			).fillingParent(insets: .content)
		}
	}
}

// MARK: -
private extension Voting.Components.Selection.View {
	var instructionsContainerLayout: AnyLayout {
		UIView().addingLayout(instructionsLayout)
	}

	var instructionsLayout: AnyLayout {
		instructionsLabel.fillingParent(horizontalInsets: .instructions)
	}

	var buttonContainerLayout: AnyLayout {
		VStack(buttons)
	}
}

// MARK: -
private extension Style where View == UILabel {
	static let instructions = Self {
		$0.font = .customFont(ofSize: .primary)
	}.displayingContent
}

// MARK: -
private extension Spacing.Vertical {
	static let body: Self = 12
}

// MARK: -
private extension Insets.Horizontal {
	static let instructions: Self = 48
}
