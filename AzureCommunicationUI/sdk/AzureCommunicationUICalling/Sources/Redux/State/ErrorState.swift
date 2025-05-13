//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public enum ErrorCategory {
  case fatal
  case callState
  case none

  public var description: String {
    switch self {
    case .fatal:
      return "fatal"
    case .callState:
      return "callState"
    case .none:
      return "none"
    }
  }
}

public struct ErrorState: Equatable {
  // errorType would be nil for no error status
  let internalError: CallCompositeInternalError?
  let error: Error?
  let errorCategory: ErrorCategory

  init(
    internalError: CallCompositeInternalError? = nil,
    error: Error? = nil,
    errorCategory: ErrorCategory = .none
  ) {
    self.internalError = internalError
    self.error = error
    self.errorCategory = errorCategory
  }

  public static func == (lhs: ErrorState, rhs: ErrorState) -> Bool {
    return (lhs.internalError == rhs.internalError)
  }

  public func toJson() -> [String: Any] {
    return [
      "internalError": self.internalError?.description ?? "",
      "error": self.error?.localizedDescription ?? "",
      "errorCategory": self.errorCategory.description,
    ]
  }
}
