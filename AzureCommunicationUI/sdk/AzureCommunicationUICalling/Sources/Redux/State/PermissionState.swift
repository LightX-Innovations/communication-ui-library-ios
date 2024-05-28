//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public enum AppPermission {
    case audioPermission
    case cameraPermission

    public enum Status: String, Equatable {
        case unknown
        case notAsked
        case requesting
        case granted
        case denied
    }
}

public struct PermissionState {

    let audioPermission: AppPermission.Status
    let cameraPermission: AppPermission.Status

    init(audioPermission: AppPermission.Status = .unknown, cameraPermission: AppPermission.Status = .unknown) {
        self.audioPermission = audioPermission
        self.cameraPermission = cameraPermission
    }

}
