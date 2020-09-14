//
//  Choice+CodingKeys.swift
//  RemoteVoteCore
//
//  Created by Jordan Kay on 9/22/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

extension Vote.Choice {
	enum CodingKeys: String, CodingKey {
		case text
		case colorString = "color"
		case index = "order"
		case value
	}
}
