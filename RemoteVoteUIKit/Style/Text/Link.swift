//
//  ActiveLabel+LinkColor.swift
//  RemoteVoteUIKit
//
//  Created by Jordan Kay on 9/18/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

import UIKit
import ActiveLabel

class LinkLabel: ActiveLabel {
	func setLinkColor(_ linkColor: UIColor) {
		enabledTypes.forEach { type in
			customColor[type] = linkColor
			customSelectedColor[type] = linkColor.darkened()
			configureLinkAttribute = { _, attributes, _ in
				var attributes = attributes
				attributes[.underlineStyle] = NSUnderlineStyle.single.rawValue
				return attributes
			}
		}
	}
}
