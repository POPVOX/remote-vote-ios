//
//  Button.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/16/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

import UIKit
import Hull
import Layoutless
import RemoteVoteCore

class Button: Hull.Button {
	var title: String? {
		get { titleLabel.text }
		set { titleLabel.text = newValue }
	}

	var showsLoadingIndicator: Bool {
		get { loadingSpinner.isAnimating }
		set {
			titleLabel.isHidden = newValue
			newValue ?
				loadingSpinner.startAnimating() :
				loadingSpinner.stopAnimating()
		}
	}

	private let titleLabel = UILabel(style: .title)
	private let backgroundView = UIView(style: .background)
	private let loadingSpinner = UIActivityIndicatorView(style: .button)

	private var storedBackgroundColor: UIColor?

	// MARK: View
	override var subviewsLayout: AnyLayout {
		backgroundView
			.addingLayout(titleLabelLayout)
			.addingLayout(loadingSpinnerLayout)
			.fillingParent()
	}

	override func setup() {
		super.setup()
		backgroundColor = Color.Background.Button.primary.color
	}
}

// MARK: -
extension Button {
	// MARK: UIView
	override var backgroundColor: UIColor? {
		get {
			backgroundView.backgroundColor
		}
		set {
			storedBackgroundColor = newValue
			backgroundView.backgroundColor = newValue
		}
	}

	// MARK: UIControl
	override var isEnabled: Bool {
		didSet {
			backgroundView.opacity = backgroundOpacity
		}
	}

	override var isHighlighted: Bool {
		didSet {
			backgroundView.backgroundColor = storedBackgroundColor?.darkened(by: backgroundDarkenedPercentage)
		}
	}
}

// MARK: -
private extension Button {
	var backgroundOpacity: Opacity {
		isEnabled ? .full : .disabled
	}

	var backgroundDarkenedPercentage: Percentage {
		isHighlighted ? .darkened : .zero
	}

	var titleLabelLayout: AnyLayout {
		titleLabel
			.centeringHorizontallyInParent()
			.fillingParent(verticalInsets: .title)
	}

	var loadingSpinnerLayout: AnyLayout {
		loadingSpinner.centeringInParent()
	}
}

// MARK: -
extension Style where View == Button {
	static let primary = Self {
		$0.backgroundColor = Color.Background.Button.primary.color
	}

	static let secondary = Self {
		$0.backgroundColor = Color.Background.Button.secondary.color
	}
}

private extension Style where View == UILabel {
	static let title = Self {
		$0.textColor = Color.Text.light.color
		$0.font = .customFont(ofSize: .primary, weight: .medium)
	}.adding(.center)
}

private extension Style where View == UIActivityIndicatorView {
	static let button = Self {
		$0.color = Color.Text.light.color
	}
}

// MARK: -
private extension Opacity {
	static let disabled: Self = 0.5
}

// MARK: -
private extension Percentage {
	static let darkened: Self = 0.1
}

// MARK: -
private extension Insets.Vertical {
	static let title: Self = 12
}
