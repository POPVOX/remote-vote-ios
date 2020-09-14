//
//  Vote+PathAccessible.swift
//  RemoteVoteCore
//
//  Created by Jordan Kay on 9/22/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import Emissary

extension Vote: PathAccessible {
	// MARK: SubpathRepresentable
	public enum PathComponents: String, PathComponent {
		case votes
		case active
		case cast
	}

	public static var component: PathComponents {
		.votes
	}
}
