//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public enum NavigationStatus {
    case setup
    case inCall
    case exit
}

public struct NavigationState: Equatable, Encodable {

    let status: NavigationStatus
    let supportFormVisible: Bool

    init(status: NavigationStatus = .setup, supportFormVisible: Bool = false) {
        self.status = status
        self.supportFormVisible = supportFormVisible
    }

    public static func == (lhs: NavigationState, rhs: NavigationState) -> Bool {
        return lhs.status == rhs.status
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.supportFormVisible, forKey: .supportFormVisible)
    }
}
