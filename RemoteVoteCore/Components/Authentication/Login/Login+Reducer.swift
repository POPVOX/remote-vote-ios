//
//  Login+Reducer.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/8/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

import ComposableArchitecture

extension Login {
	typealias Reducer = ComposableArchitecture.Reducer<State, Action, Environment>

	static let reducer = Reducer { state, action, environment in
		switch action {
		case .request(.authenticate):
			guard let email = state.email else { return .none }
			state.$authenticationResponse.indicateFetching()
			return authenticationEffect(in: environment, using: email)
		case let .request(.activate(token)):
			state.$accessToken.indicateFetching()
			return activationEffect(in: environment, for: token)
		case let .event(.emailUpdated(text)):
			state.email = text.map(User.Email.init)
		case let .event(.authenticated(.success(response))):
			state.authenticationResponse = response
		case let .event(.authenticated(.failure(error))):
			state.$authenticationResponse.indicateFailure(with: error)
		case let .event(.activated(.success(accessToken))):
			state.accessToken = accessToken
		case let .event(.activated(.failure(error))):
			state.$accessToken.indicateFailure(with: error)
		case .activation(.request(.finish)):
			state.authenticationResponse = nil
		}

		return .none
	}
}
