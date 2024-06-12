//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public enum AppStatus {
    case foreground
    case background
    case willTerminate

    var description: String {
        switch self {
        case .foreground:
            return "foreground"
        case .background:
            return "background"
        case .willTerminate:
            return "willTerminate"
        }
    }
}

public struct LifeCycleState: Encodable {

    let currentStatus: AppStatus

    init(currentStatus: AppStatus = .foreground) {
        self.currentStatus = currentStatus
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(currentStatus, forKey: .currentStatus)
    }
}
