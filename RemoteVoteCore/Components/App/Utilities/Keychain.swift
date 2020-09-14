//
//  Keychain.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/23/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

import KeychainAccess

extension App {
	class Keychain {
		private let storage = KeychainAccess.Keychain(service: "com.popvox.RemoteVote")
	}
}

// MARK: -
extension App.Keychain {
	enum Key: String {
		case accessToken
	}

	subscript(key: Key) -> String? {
		get { storage[key.rawValue] }
		set { storage[key.rawValue] = newValue }
	}
}
