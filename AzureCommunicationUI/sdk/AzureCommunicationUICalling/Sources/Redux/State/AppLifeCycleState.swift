//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public enum AppStatus {
  case foreground
  case background
  case willTerminate

  public var description: String {
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

public struct LifeCycleState {

  let currentStatus: AppStatus

  init(currentStatus: AppStatus = .foreground) {
    self.currentStatus = currentStatus
  }

  public func toJson() -> [String: Any] {
    return ["currentStatus": self.currentStatus.description]
  }
}
