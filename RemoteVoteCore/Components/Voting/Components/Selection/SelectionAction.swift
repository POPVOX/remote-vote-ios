//
//  SelectionAction.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/2/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

public extension Voting.Components.Selection {
	enum Action {
		case request(Request)
		case event(Event)
	}
}

// MARK: -
public extension Voting.Components.Selection.Action {
	enum Request {
		case select(Vote.Choice)
		case takePhoto(Vote.Choice)
	}

	enum Event {
		case photoCanceled
		case photoSaved(Data)
		case choiceSelected(Voting.Components.Confirmation.State)
	}
}
