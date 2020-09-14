//
//  RemoteVoteAPI+Identifier.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/20/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import Identity
import Emissary

extension Identifier: PathComponent where Value.RawIdentifier == Int {
	public var stringValue: String {
		return .init(describing: rawValue)
	}
}
