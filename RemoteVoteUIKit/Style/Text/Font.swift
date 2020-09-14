//
//  Font.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/16/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import UIKit
import Hull

extension Size.Font {
	static let primary: Self = 16
	static let secondary: Self = 14
	static let heading: Self = 32
	static let subheading: Self = 20
}

// MARK: -
extension UIFont {
	static func customFont(ofSize size: Size.Font, weight: UIFont.Weight = .regular) -> UIFont {
		UIFont(
			name: name(for: weight),
			size: size.value
		)!
	}
}

// MARK: -
private extension UIFont {
	static func name(for weight: UIFont.Weight) -> String {
		switch weight {
		case .medium:
			return "Avenir-Heavy"
		case .bold:
			return "Avenir-Black"
		default:
			return "Avenir"
		}
	}
}
