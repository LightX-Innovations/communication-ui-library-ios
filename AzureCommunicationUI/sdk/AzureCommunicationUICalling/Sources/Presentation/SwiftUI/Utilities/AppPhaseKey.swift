//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation
import SwiftUI

struct AppPhaseKey: EnvironmentKey {
    static let defaultValue: AppStatus = .foreground
}

extension EnvironmentValues {
    var appPhase: AppStatus {
        // swiftlint:disable:next implicit_getter
        get { self[AppPhaseKey.self] }
        set { self[AppPhaseKey.self] = newValue }
    }
}
