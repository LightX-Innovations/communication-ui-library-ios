//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public struct VideoStreamInfoModel: Hashable, Equatable {
    public enum MediaStreamType {
        case cameraVideo
        case screenSharing
    }
    let videoStreamIdentifier: String
    let mediaStreamType: MediaStreamType
}
