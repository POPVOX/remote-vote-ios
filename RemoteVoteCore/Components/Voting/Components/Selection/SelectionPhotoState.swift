//
//  SelectionPhotoState.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/7/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

extension Voting.Components.Selection {
	enum Photo {}
}

// MARK: -
extension Voting.Components.Selection.Photo {
	enum State {
		case notYetTaken
		case taking(Vote.Choice)
		case taken(Data)
	}
}

// MARK: -
extension Voting.Components.Selection.Photo.State: Equatable {}
