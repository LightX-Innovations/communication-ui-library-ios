//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public struct DefaultUserState: Encodable {
    public enum CameraState: Equatable, String, CodingKey {
        case on
        case off
    }

    public enum AudioState: Equatable, String, CodingKey {
        case on
        case off
    }

    let cameraState: CameraState
    let audioState: AudioState

    init(cameraState: CameraState = .off,
         audioState: AudioState = .off) {
        self.cameraState = cameraState
        self.audioState = audioState
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.cameraState, forKey: .cameraState)
        try container.encode(self.audioState, forKey: .audioState)
    }
}
