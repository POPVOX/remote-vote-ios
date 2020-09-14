//
//  Text.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/16/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import UIKit
import Layoutless

extension Style where View == UILabel {
	static let heading = Self {
		$0.font = .customFont(ofSize: .heading, weight: .bold)
	}.displayingContent

	static let subheading = Self {
		$0.font = .customFont(ofSize: .subheading, weight: .bold)
	}.displayingContent
}
