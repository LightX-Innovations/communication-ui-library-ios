//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public enum AudioSessionStatus {
  case active
  case interrupted

  public var description: String {
    switch self {
    case .active:
      return "active"
    case .interrupted:
      return "interrupted"
    }
  }
}

public struct AudioSessionState {

  let status: AudioSessionStatus

  init(status: AudioSessionStatus = .active) {
    self.status = status
  }

  public func toJson() -> [String: Any] {
    return [
      "status": self.status.description
    ]
  }
}
