//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//
import Foundation

public struct RttState: Equatable {
    var isRttOn: Bool
    var isMaximized: Bool

    init(isEnabled: Bool = false, isMaximized: Bool = false) {
        self.isRttOn = isEnabled
        self.isMaximized = isMaximized
    }
}
