//
//  LoginState.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/2/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

public extension Login {
	struct State {
		var email: String?

		@Authorized public internal(set) var accessToken: RemoteVote.API.AccessToken?
		@Authorized public internal(set) var authenticationResponse: String?
	}
}


// MARK: -
public extension Login.State {
	var activationState: Login.Activation.State? {
		authenticationResponse.map { _ in .init() }
	}
	
	var canLogIn: Bool {
		email.map { $0.isValidEmail && !$authenticationResponse.isBeingFetched } ?? false
	}
}

// MARK: -
extension Login.State: Equatable {}

// MARK: -
private extension String {
	var isValidEmail: Bool {
		range(of: ".+@.+\\..+", options: .regularExpression) != nil
	}
}
