//
//  TimerState+Presentation.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/1/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

public extension Voting.Timer.State {
	var remainingTimeString: String {
		remainingTime.flatMap(Formatter.positional.string) ?? .emptyPositional
	}
}

// MARK: -
private extension String {
	static let emptyPositional = "--:--"
}

// MARK: -
private extension Formatter {
	static let positional: DateComponentsFormatter = {
		let formatter = DateComponentsFormatter()
		formatter.allowedUnits = [.minute, .second]
		formatter.zeroFormattingBehavior = .pad
		formatter.unitsStyle = .positional
		return formatter
	}()
}
