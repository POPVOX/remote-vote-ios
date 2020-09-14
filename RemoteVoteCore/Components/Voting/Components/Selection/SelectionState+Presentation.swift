//
//  SelectionState+Presentation.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/15/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

public extension Voting.Components.Selection.State {
	var voteInstructions: String? {
		vote.instructions
	}

	var voteChoices: [(Vote.Choice, String)] {
		vote.choices.map { ($0, $0.colorString) }
	}
}

// MARK: -
public extension Vote.Choice {
	var selectionTitle: String {
		text.uppercased()
	}
}
