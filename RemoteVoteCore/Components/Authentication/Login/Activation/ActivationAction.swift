//
//  ActivationAction.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/7/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

public extension Login.Activation {
	enum Action {
		case request(Request)
	}
}

// MARK: -
public extension Login.Activation.Action {
	enum Request {
		case finish
	}
}
