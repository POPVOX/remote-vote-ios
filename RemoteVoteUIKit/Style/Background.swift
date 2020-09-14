//
//  Background.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/20/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

import UIKit
import Hull
import Layoutless
import RemoteVoteCore

extension Style where View == UIView {
	static let background = Self {
		$0.isUserInteractionEnabled = false
		$0.backgroundColor = Color.Background.content.color
		$0.cornerRadius = .background
	}
}

// MARK: -
extension CornerRadius {
	static let background: Self = 8
}
