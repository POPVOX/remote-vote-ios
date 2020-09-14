//
//  Timer+Effect.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/1/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import ComposableArchitecture

extension Voting.Timer {
	typealias Effect = ComposableArchitecture.Effect<Action, Never>

	static func countdownEffect(in environment: Environment) -> Effect {
		ComposableArchitecture.Effect
			.timer(id: 0, every: .second, on: DispatchQueue.main)
			.map(Action.Event.momentPassed)
			.map(Action.event)
	}
}

// MARK: -
private extension DispatchQueue.SchedulerTimeType.Stride {
	static let second: Self = 1
}
