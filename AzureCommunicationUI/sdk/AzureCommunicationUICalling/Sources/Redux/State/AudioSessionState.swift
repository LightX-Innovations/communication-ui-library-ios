//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public enum AudioSessionStatus {
    case active
    case interrupted
}

public struct AudioSessionState: Encodable {

    let status: AudioSessionStatus

    init(status: AudioSessionStatus = .active) {
        self.status = status
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.status, forKey: .status)
    }
}
