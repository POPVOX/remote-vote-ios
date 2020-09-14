//
//  Authorized.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/16/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//  

import Granular
import Emissary

public typealias Authorized<Resource: Fetchable> = Fetch.Wrapper<Resource, NetworkError<RemoteVote.Authorization.API.Error>>
