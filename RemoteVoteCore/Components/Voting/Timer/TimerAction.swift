//
//  TimerAction.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/1/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

public extension Voting.Timer {
	enum Action {
		case request(Request)
		case event(Event)
	}
}

// MARK: -
public extension Voting.Timer.Action {
	enum Request {
		case start
	}

	enum Event {
		case momentPassed(DispatchQueue.SchedulerTimeType)
	}
}
