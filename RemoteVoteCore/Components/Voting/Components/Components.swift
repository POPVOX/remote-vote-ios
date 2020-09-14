//
//  Components.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/24/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import ComposableArchitecture

public extension Voting {
	enum Components {
		public typealias Store = ComposableArchitecture.Store<State, Action>
	}
}
