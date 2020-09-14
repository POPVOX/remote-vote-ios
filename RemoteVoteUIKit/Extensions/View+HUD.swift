//
//  View+HUD.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/7/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import ComposableArchitecture
import Hull
import Granular
import Emissary
import RemoteVoteCore

@_implementationOnly import JGProgressHUD

extension View {
	enum HUDOption {
		case progress
		case success
		case error
		case reload
	}

	typealias HUDOptions = Set<HUDOption>

	func showHUD<Resource: Equatable, Error: APIError>(fetching keyPath: KeyPath<StorePublisher<State>, StorePublisher<Fetch.Wrapper<Resource, NetworkError<Error>>>>, with options: HUDOptions = [.progress, .error]) {
		let hud = JGProgressHUD(style: .dark)

		observe(keyPath) { [weak self] resource in
			guard let self = self else { return }

			if resource.isBeingFetched {
				self.indicateFetching(resource, for: hud, with: options)
			} else if resource.isFetched {
				self.indicateSuccess(for: hud, with: options)
			} else if let error = resource.failureError {
				self.indicateFailure(for: hud, with: error)
			}
		}
	}
}

// MARK: -
private extension View {
	func indicateFetching<Resource: Equatable, Error: APIError>(_ resource: Fetch.Wrapper<Resource, NetworkError<Error>>, for hud: JGProgressHUD, with options: HUDOptions) {
		guard
			options.contains(.progress) &&
			(options.contains(.reload) || resource.isInitiallyFetching) else { return }
		window.map(hud.show)
	}

	func indicateSuccess(for hud: JGProgressHUD, with options: HUDOptions) {
		if options.contains(.success) {
			hud.indicatorView = JGProgressHUDSuccessIndicatorView()
			hud.textLabel.text = Strings.Hud.Message.success
			window.map(hud.show)
			hud.dismiss(afterDelay: .delay)
		} else {
			hud.dismiss()
		}
	}

	func indicateFailure<Error: APIError>(for hud: JGProgressHUD, with error: NetworkError<Error>) {
		hud.indicatorView = JGProgressHUDErrorIndicatorView()
		switch error {
		case let .requestUnsuccessful(_, error):
			hud.textLabel.text = error.message
		default:
			hud.textLabel.text = Strings.Hud.Message.Error.network
		}
		hud.dismiss(afterDelay: .delay)
	}
}

// MARK: -
private extension TimeInterval {
	static let delay: Self = 3
}
