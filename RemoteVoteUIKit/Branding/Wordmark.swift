//
//  Wordmark.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/24/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

import UIKit
import Layoutless
import RemoteVoteCore

extension Style where View == UIImageView {
	enum Wordmark {}
}

// MARK: -
extension Style.Wordmark {
	static let remoteVote = Style {
		$0.image = Image.Wordmark.remoteVote.image
	}
}
