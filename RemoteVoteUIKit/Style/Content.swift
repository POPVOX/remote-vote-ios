//
//  Content.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/2/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import UIKit
import Hull
import Layoutless

extension Style where View: UILabel {
	public var displayingContent: Self {
		adding(.center).adding(.multiline)
	}
}

// MARK: -
extension Insets {
	static let content: Self = 20
}
