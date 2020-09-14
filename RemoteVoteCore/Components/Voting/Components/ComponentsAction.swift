//
//  ComponentsAction.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/2/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

public extension Voting.Components {
	enum Action {
		case summary(Summary.Action)
		case selection(Selection.Action)
		case confirmation(Confirmation.Action)
		case contact(Contact.Action)
	}
}
