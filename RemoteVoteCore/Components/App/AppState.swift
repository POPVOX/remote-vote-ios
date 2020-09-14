//
//  AppState.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/1/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import CasePaths

public extension App {
	struct State {
		public init() {}
		
		private var authenticationState: Authentication.State?
	}
}

// MARK: -
public extension App.State {
	var loginState: Login.State? {
		get { self[.loginState] }
		set { self[.loginState] = newValue }
	}

	var mainState: Main.State? {
		get { self[.mainState] }
		set { self[.mainState] = newValue }
	}
}

// MARK: -
extension App.State: Equatable {}

// MARK: -
private extension App.State {
	subscript<Value>(casePath: CasePath<Authentication.State, Value>) -> Value? {
		get { authenticationState.flatMap(casePath.extract) }
		set { authenticationState = newValue.map(casePath.embed) }
	}
}
