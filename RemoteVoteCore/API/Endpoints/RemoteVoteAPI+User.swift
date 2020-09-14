//
//  RemoteVoteAPI+User.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/23/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import Emissary

extension RemoteVote.API {
	func fetchUser() -> Request<User> {
		getResource()
	}
}
