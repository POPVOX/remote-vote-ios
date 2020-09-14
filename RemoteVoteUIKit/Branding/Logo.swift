//
//  Logo.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/20/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import UIKit
import Layoutless
import RemoteVoteCore

extension Style where View == UIImageView {
	enum Logo {}
}

// MARK: -
extension Style.Logo {
	enum RemoteVote {}
}

// MARK: -
extension Style.Logo.RemoteVote {
	static let active = Style {
		$0.image = Image.Logo.RemoteVote.active.image
	}

	static let inactive = Style {
		$0.image = Image.Logo.RemoteVote.inactive.image
	}

	static let inverted = Style {
		$0.image = Image.Logo.RemoteVote.inverted.image
	}
}
