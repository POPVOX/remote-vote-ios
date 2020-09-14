//
//  JSON.swift
//  RemoteVoteCoreTests
//
//  Created by Jordan Kay on 9/21/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

typealias JSON = [String: Any]

extension JSON {
	func encoded() throws -> Any {
		try mapValues { value -> Any in
			if let json = value as? JSON {
				return try json.encoded()
			} else if let jsonArray = value as? [JSON] {
				return try jsonArray.map { try $0.encoded() }
			} else if let encodable = value as? Encodable {
				return try encodable.toJSON()
			}
			return value
		}
	}
}
