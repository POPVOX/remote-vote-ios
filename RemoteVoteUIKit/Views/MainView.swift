//
//  MainView.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/23/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

import UIKit
import Hull
import Layoutless
import RemoteVoteCore

public extension Main {
	final class View: Hull.View<State, Action> {
		private let votingView: Voting.View

		// MARK: View
		public override func setup() {
			backgroundColor = background.color
		}

		// MARK: View
		public required init(store: Store) {
			votingView = .viewScoping(\.votingState, with: Action.voting, from: store)
			super.init(store: store)
		}

		public override var body: AnyLayout {
			votingView
				.scrolling(.vertical) { $0.contentInset.bottom = Insets.Vertical.default.value }
				.fillingParent(relativeToSafeArea: true)
		}

		// MARK: NSCoding
		required init?(coder: NSCoder) {
			fatalError()
		}
	}
}
