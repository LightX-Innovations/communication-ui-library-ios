//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public struct VideoStreamInfoModel: Hashable, Equatable {
  public enum MediaStreamType {
    case cameraVideo
    case screenSharing

    public var description: String {
      switch self {
      case .cameraVideo:
        return "cameraVideo"
      case .screenSharing:
        return "screenSharing"
      }
    }
  }
  let videoStreamIdentifier: String
  let mediaStreamType: MediaStreamType

  public func toJson() -> [String: Any] {
    return [
      "videoStreamIdentifier": self.videoStreamIdentifier,
      "mediaStreamType": self.mediaStreamType.description,
    ]
  }
}
