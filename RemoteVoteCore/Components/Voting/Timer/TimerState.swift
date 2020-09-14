//
//  TimerState.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/1/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

public extension Voting.Timer {
	struct State {
		private(set) var remainingTime: TimeInterval?
		
		private let deadline: Date?
	}
}

// MARK: -
extension Voting.Timer.State {
	init(voteStatus: Vote.Status) {
		deadline = voteStatus.activeVote?.endTime
		updateRemainingTime()
	}

	mutating func updateRemainingTime() {
		let timeUntilDeadline = deadline?.timeIntervalSince(.init())
		remainingTime = timeUntilDeadline.map { max($0, 0) }
	}
}

// MARK: -
extension Voting.Timer.State: Equatable {}
