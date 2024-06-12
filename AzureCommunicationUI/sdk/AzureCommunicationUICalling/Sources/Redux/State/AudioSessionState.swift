//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public enum AudioSessionStatus {
    case active
    case interrupted
}

public struct AudioSessionState {

    let status: AudioSessionStatus

    init(status: AudioSessionStatus = .active) {
        self.status = status
    }
}
