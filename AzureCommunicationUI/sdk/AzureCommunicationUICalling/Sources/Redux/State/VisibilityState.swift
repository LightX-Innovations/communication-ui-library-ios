//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public enum VisibilityStatus {
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

public struct VisibilityState {

  let currentStatus: VisibilityStatus

  init(currentStatus: VisibilityStatus = .visible) {
    self.currentStatus = currentStatus
  }

  public func toJson() -> [String: Any] {
    return [
      "currentStatus": self.currentStatus.description
    ]
  }
}
