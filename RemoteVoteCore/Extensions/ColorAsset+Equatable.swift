//
//  Color.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/10/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

extension ColorAsset: Equatable {
	public static func ==(lhs: ColorAsset, rhs: ColorAsset) -> Bool {
		lhs.name == rhs.name
	}
}
