//
//  AuthenticationState.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/1/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

import CasePaths

extension Authentication {
	enum State {
		case loginState(Login.State)
		case mainState(Main.State)
	}
}

// MARK: -
extension Authentication.State: Equatable {}

// MARK: -
extension CasePath where Root == Authentication.State {
	static var loginState: CasePath<Root, Login.State> {
		/Root.loginState
	}

	static var mainState: CasePath<Root, Main.State> {
		/Root.mainState
	}
}
