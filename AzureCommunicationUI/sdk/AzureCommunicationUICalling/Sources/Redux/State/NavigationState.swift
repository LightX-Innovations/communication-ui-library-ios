//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public enum NavigationStatus {
  case setup
  case inCall
  case exit

  public var description: String {
    switch self {
    case .setup:
      return "setup"
    case .inCall:
      return "inCall"
    case .exit:
      return "exit"
    }
  }
}

public struct NavigationState: Equatable {

  let status: NavigationStatus
  let supportFormVisible: Bool

  init(status: NavigationStatus = .setup, supportFormVisible: Bool = false) {
    self.status = status
    self.supportFormVisible = supportFormVisible
  }

  public static func == (lhs: NavigationState, rhs: NavigationState) -> Bool {
    return lhs.status == rhs.status
  }

  public func toJson() -> [String: Any] {
    return [
      "status": self.status.description,
      "supportFormVisible": self.supportFormVisible,
    ]
  }
}
