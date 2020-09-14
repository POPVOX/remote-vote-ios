//
//  ComponentsView.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/24/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

import UIKit
import Hull
import Layoutless
import RemoteVoteCore

extension Voting.Components {
	final class View: Hull.View<State, Action> {
		private let summaryView: Summary.View

		private var selectionView: Selection.View?
		private var confirmationView: Confirmation.View?
		private var contactView: Contact.View?

		// MARK: View
		override func setup() {
			assign(\.showsSummary, to: \.isVisible, on: summaryView)
			scope(\.selectionState, with: Action.selection, backing: \.selectionView, on: self)
			scope(\.confirmationState, with: Action.confirmation, backing: \.confirmationView, on: self)
			scope(\.contactState, with: Action.contact, backing: \.contactView, on: self)
			dependLayout(on: \.contentState)
		}

		// MARK: View
		required init(store: Store) {
			summaryView = .viewScoping(\.summaryState, with: Action.summary, from: store)
			super.init(store: store)
		}

		override var body: AnyLayout {
			VStack(spacing: .default, distribution: .fill)(
				upperLayout,
				lowerLayout
			).fillingParent(horizontalInsets: .default)
		}

		// MARK: NSCoding
		required init?(coder: NSCoder) {
			fatalError()
		}
	}
}

// MARK: -
extension Voting.Components.View {
	var upperLayout: AnyLayout {
		VStack(
			summaryView,
			selectionView,
			confirmationView
		)
	}

	var lowerLayout: AnyLayout {
		contactContainerLayout ?? EmptyLayout()
	}

	var contactContainerLayout: AnyLayout? {
		contactLayout.map(UIView().addingLayout)
	}

	var contactLayout: AnyLayout? {
		contactView?.fillingParent()
	}
}
