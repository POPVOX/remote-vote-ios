//
//  HeaderState+Presentation.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/1/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

public extension Voting.Header.State {
	private typealias HeaderStrings = Strings.Voting.Header

	var logoImage: ImageAsset {
		let remoteVote = Image.Logo.RemoteVote.self
		switch voteStatus {
		case .active:
			return remoteVote.active
		case .inactive:
			return remoteVote.inactive
		}
	}

	var bodyString: String {
		let string: String
		let body = HeaderStrings.Body.self
		switch voteStatus {
		case .active:
			string = body.active
		case .inactive:
			string = body.inactive
		}
		return string.uppercased()
	}

	var bodyTextColor: ColorAsset {
		switch voteStatus {
		case .active:
			return Color.tint
		case .inactive:
			return Color.Text.disabled
		}
	}
}
