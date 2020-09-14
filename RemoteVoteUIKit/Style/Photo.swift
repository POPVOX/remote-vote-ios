//
//  Photo.swift
//  RemoteVote
//
//  Created by Jordan Kay on 9/15/20.
//  Copyright © 2020 POPVOX, Inc. All rights reserved.
//

import UIKit
import Hull

extension Configuration where Object == UIImagePickerController {
	static let selfie = Self {
		$0.sourceType = .camera
		$0.cameraDevice = .front
		$0.allowsEditing = true
	}
}

// MARK: -
extension Width {
	static let compressedPhoto: Self = 250
}
