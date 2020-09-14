//
//  VoteCastPayload.swift
//  RemoteVoteCore
//
//  Created by Jordan Kay on 9/22/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

extension Vote.Cast {
	struct Payload {
		let choices: [Choice]
		let photoData: Data
	}
}
