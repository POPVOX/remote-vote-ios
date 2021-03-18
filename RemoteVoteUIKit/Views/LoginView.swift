//
//  LoginView.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/20/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import UIKit
import Hull
import Layoutless
import RemoteVoteCore

public extension Login {
	final class View: Hull.View<State, Action> {
		private let wordmarkView = UIImageView(style: Style.Wordmark.remoteVote)
		private let emailPromptLabel = UILabel(style: .prompt)
		private let emailTextField = TextField(style: .email)
		private let loginButton = Button(style: .primary)
		
		// MARK: View
		public override func setup() {
			backgroundColor = background.color
			emailPromptLabel.text = emailPrompt
			emailTextField.placeholder = emailTextFieldPlaceholder
			loginButton.title = loginButtonTitle

			assign(\.canLogIn, to: \.isEnabled, on: loginButton)
			assign(\.$authenticationResponse.isBeingFetched, to: \.showsLoadingIndicator, on: loginButton)
			showHUD(fetching: \.$authenticationResponse, with: [.error])
			showHUD(fetching: \.$accessToken)
			scope(\.activationState, with: Action.activation, routingTo: Activation.View.self, using: .modal)
			handleTapping(loginButton) { .request(.authenticate) }
			handleEditing(emailTextField) { .event(.emailUpdated(text: $0)) }
		}

		// MARK: View
		public override var body: AnyLayout {
			VStack(distribution: .fillEqually)(
				contentLayout,
				UIView()
			).fillingParent(relativeToSafeArea: true)
		}
	}
}

// MARK: -
private extension Login.View {
	var contentLayout: AnyLayout {
		VStack(
			wordmarkContainerLayout,
			inputContainerLayout
		)
	}

	var wordmarkContainerLayout: AnyLayout {
		UIView().addingLayout(wordmarkLayout)
	}

	var wordmarkLayout: AnyLayout {
		wordmarkView
			.scaledProportionally(toHeight: .wordmark)
			.centeringInParent()
	}

	var inputContainerLayout: AnyLayout {
		UIView().addingLayout(inputLayout)
	}

	var inputLayout: AnyLayout {
		VStack(spacing: .input)(
			emailPromptLabel,
			emailTextFieldLayout,
			loginButton
		).fillingParent(horizontalInsets: .input)
	}

	var emailTextFieldLayout: AnyLayout {
		emailTextField.sizing(toHeight: .textField)
	}
}

// MARK: -
private extension Style where View == UILabel {
	static let prompt = Self {
		$0.textColor = Login.text.color
		$0.font = .customFont(ofSize: .prompt, weight: .medium)
	}.displayingContent
}

private extension Style where View == UITextField {
	static let email = Self {
		$0.borderStyle = .roundedRect
		$0.keyboardType = .emailAddress
		$0.autocorrectionType = .no
		$0.autocapitalizationType = .none
	}
}

// MARK: -
private extension Height {
	static let wordmark: Self = 60
	static let textField: Self = 50
}

// MARK: -
private extension Spacing.Vertical {
	static let input: Self = 16
}

// MARK: -
private extension Insets.Horizontal {
	static let input: Self = 32
}

// MARK: -
private extension Size.Font {
	static let prompt: Self = 14
}
