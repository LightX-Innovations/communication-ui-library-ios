//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public enum AppPermission {
  case audioPermission
  case cameraPermission

  public enum Status: String, Equatable {
    case unknown
    case notAsked
    case requesting
    case granted
    case denied

    public var description: String {
      switch self {
      case .unknown:
        return "unknown"
      case .notAsked:
        return "notAsked"
      case .requesting:
        return "requesting"
      case .granted:
        return "granted"
      case .denied:
        return "denied"
      }
    }
  }
}

public struct PermissionState {

  let audioPermission: AppPermission.Status
  let cameraPermission: AppPermission.Status

  init(
    audioPermission: AppPermission.Status = .unknown,
    cameraPermission: AppPermission.Status = .unknown
  ) {
    self.audioPermission = audioPermission
    self.cameraPermission = cameraPermission
  }

  public func toJson() -> [String: Any] {
    return [
      "audioPermission": self.audioPermission.description,
      "cameraPermission": self.cameraPermission.description,
    ]
  }
}
