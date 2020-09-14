//
//  Tint.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/20/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import UIKit
import Layoutless
import RemoteVoteCore

extension Style where View == UIView {
	static let tint = Self {
		$0.backgroundColor = Color.tint.color
	}
}
