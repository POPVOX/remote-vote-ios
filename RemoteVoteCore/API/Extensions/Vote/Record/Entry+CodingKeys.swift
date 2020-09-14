//
//  Entry+CodingKeys.swift
//  RemoteVoteCore
//
//  Created by Jordan Kay on 9/22/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

extension Vote.Record.Entry {
	enum CodingKeys: String, CodingKey {
		case voteID = "voteId"
		case choiceText = "textValue"
		case choiceValue = "intValue"
	}
}
