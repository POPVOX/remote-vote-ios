//
//  Storage.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/23/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

extension App {
	class Storage {
		private let api: RemoteVote.API
		private let userDefaults = UserDefaults.standard

		init(api: RemoteVote.API) {
			self.api = api
		}
	}
}

extension App.Storage {
	enum Key: String {
		case user
	}

	subscript<Resource: Codable>(key: Key) -> Resource? {
		get {
			let data = userDefaults.data(forKey: key.rawValue)
			return data.flatMap { try? api.decoder.decode(Resource.self, from: $0) }
		}
		set {
			let data = newValue.flatMap { try? api.encoder.encode($0) }
			userDefaults.set(data, forKey: key.rawValue)
		}
	}
}

