//
//  Image.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/10/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

extension ImageAsset: Equatable {
	public static func ==(lhs: ImageAsset, rhs: ImageAsset) -> Bool {
		lhs.name == rhs.name
	}
}

