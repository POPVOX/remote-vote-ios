//
//  SummaryState+Presentation.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/2/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

public extension Voting.Components.Summary.State {
	var title: String? {
		vote?.title.uppercased()
	}

	var subtitle: String? {
		vote?.subtitle
	}

	var heading: String? {
		vote?.heading
	}

	var subheading: String? {
		vote?.subheading
	}
}
