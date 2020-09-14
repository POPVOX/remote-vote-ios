//
//  Group.swift
//  RemoteVoteCore
//
//  Created by Jordan Kay on 9/21/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

import Identity

public struct Group {
	public let id: ID
}

// MARK: -
extension Group: Equatable {}

extension Group: Identifiable {
	public typealias RawIdentifier = Int
}

