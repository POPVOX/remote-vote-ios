//
//  VotingView.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/24/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

import UIKit
import Hull
import Layoutless
import RemoteVoteCore

extension Voting {
	final class View: Hull.View<State, Action> {
		private var headerView: Header.View?
		private var timerView: Timer.View?
		private var componentsView: Components.View?

		// MARK: View
		override func setup() {
			scope(\.headerState, with: Action.header, backing: \.headerView, on: self)
			scope(\.timerState, with: Action.timer, backing: \.timerView, on: self)
			scope(\.componentsState, with: Action.components, backing: \.componentsView, on: self)
			showHUD(fetching: \.$voteStatus)
			dependLayout(on: \.voteStatus)
			handle(UIApplication.willEnterForegroundNotification) { .request(.fetchActiveVote) }
		}

		// MARK: View
		override var body: AnyLayout {
			VStack(
				headerView,
				timerView,
				componentsView
			).fillingParent()
		}
	}
}
