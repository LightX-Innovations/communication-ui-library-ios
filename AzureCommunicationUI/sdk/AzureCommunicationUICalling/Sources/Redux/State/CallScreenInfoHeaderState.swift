//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public struct CallScreenInfoHeaderState {
    let title: String?
    let subtitle: String?
    init(title: String? = nil, subtitle: String? = nil) {
        self.title = title
        self.subtitle = subtitle
    }
}
