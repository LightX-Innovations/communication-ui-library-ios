//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public enum AppPermission: String, CodingKey {
    case audioPermission
    case cameraPermission

    public enum Status: String, Equatable, CodingKey {
        case unknown
        case notAsked
        case requesting
        case granted
        case denied
    }
}

public struct PermissionState: Encodable {

    let audioPermission: AppPermission.Status
    let cameraPermission: AppPermission.Status

    init(audioPermission: AppPermission.Status = .unknown, cameraPermission: AppPermission.Status = .unknown) {
        self.audioPermission = audioPermission
        self.cameraPermission = cameraPermission
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.audioPermission, forKey: .audioPermission)
        try container.encode(self.cameraPermission, forKey: .cameraPermission)
    }

}
