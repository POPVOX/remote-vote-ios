//
//  RemoteVoteAPI+PathAccessible.swift
//  RemoteVote
//
//  Created by Jordan Kay on 7/20/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import Emissary

extension RemoteVote.API {
	func getResource<Resource: Decodable>() -> Request<Resource> where Resource: PathAccessible {
		let path = Resource.path
		return getResource(at: path)
	}

	func getResourceCollection<ResourceCollection: Decodable & Collection>() -> Request<ResourceCollection> where ResourceCollection.Element: PathAccessible {
		let path = ResourceCollection.Element.path
		return getResource(at: path)
	}

	func getResourceCollection<ResourceCollection: Decodable & Collection, ResourceParameters: Parameters>(specifiedBy parameters: ResourceParameters) -> Request<ResourceCollection> where ResourceCollection.Element: PathAccessible {
		let path = ResourceCollection.Element.path
		return getResource(at: path, specifiedBy: parameters)
	}
}
