//
//  Fetched.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/20/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import Granular
import Emissary

public typealias Fetched<Resource: Fetchable> = Fetch.Wrapper<Resource, NetworkError<RemoteVote.API.Error>>
