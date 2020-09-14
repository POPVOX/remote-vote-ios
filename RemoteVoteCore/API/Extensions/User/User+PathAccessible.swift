//
//  User+PathAccessible.swift
//  RemoteVoteCore
//
//  Created by Jordan Kay on 9/22/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import Emissary

extension User: PathAccessible {
	// MARK: SubpathRepresentable
	public enum PathComponents: String, PathComponent {
		case user
	}

	public static var component: PathComponents {
		.user
	}
}
