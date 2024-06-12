//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public enum VisibilityStatus: String, CodingKey {
    case visible
    case hideRequested
    case hidden
    case pipModeRequested
    case pipModeEntered

    var description: String {
        switch self {
        case .visible:
            return "visible"
        case .hideRequested:
            return "hideRequested"
        case .hidden:
            return "hidden"
        case .pipModeRequested:
            return "pipModeRequested"
        case .pipModeEntered:
            return "pipModeEntered"
        }
    }
}

public struct VisibilityState: Encodable {

    let currentStatus: VisibilityStatus

    init(currentStatus: VisibilityStatus = .visible) {
        self.currentStatus = currentStatus
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.currentStatus, forKey: .currentStatus)
    }
}
