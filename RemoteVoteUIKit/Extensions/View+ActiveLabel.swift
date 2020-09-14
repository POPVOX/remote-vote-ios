//
//  View+ActiveLabel.swift
//  RemoteVoteUIKit
//
//  Created by Jordan Kay on 9/17/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import Hull
import ActiveLabel

public extension View {
	func handleTapping(_ type: ActiveType, in label: ActiveLabel, with action: @escaping () -> Action) {
		label.handleCustomTap(for: type) { [weak self] _ in
			self?.viewStore.send(action())
		}
	}
}
