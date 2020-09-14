//
//  AppDelegate.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/19/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import UIKit
import Combine
import Hull
import RemoteVoteCore
import RemoteVoteUIKit

extension App {
	@UIApplicationMain class Delegate: UIResponder {
		var window: UIWindow?
		var scope = Set<AnyCancellable>()

		private let store = Store(
			initialState: .init(),
			reducer: reducer,
			environment: .init()
		)

		private let viewStore: ViewStore

		override init() {
			viewStore = .init(store)
			super.init()
		}
	}
}

// MARK: -
extension App.Delegate: UIApplicationDelegate {
	func application(_: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		setupWindow()
		observeAuthentication()
		viewStore.send(.event(.launchFinished))
		return true
	}

	func application(_: UIApplication, open url: URL, options _: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
		guard
			let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
			let action = components.host else { return false }

		switch action {
		case "activate":
			let token = components.path.split(separator: "/").last.map(String.init)!
			viewStore.send(.login(.request(.activate(token: token))))
			return true
		case "cast-vote":
			return true
		default:
			return false
		}
	}
}

// MARK: -
private extension App.Delegate {
	func setupWindow() {
		let window = UIWindow(frame: UIScreen.main.bounds)
		window.makeKeyAndVisible()
		self.window = window
	}

	func observeAuthentication() {
		store.scope(
			state: \.loginState,
			action: App.Action.login
		).ifLet(then: showLogin).store(in: &scope)

		store.scope(
			state: \.mainState,
			action: App.Action.authenticated
		).ifLet(then: showAuthenticated).store(in: &scope)
	}

	func showLogin(using store: Login.Store) {
		let view = Login.View(store: store)
		window?.rootViewController = ViewController(view: view)
	}

	func showAuthenticated(using store: Main.Store) {
		let view = Main.View(store: store)
		window?.rootViewController = ViewController(view: view)
	}
}
