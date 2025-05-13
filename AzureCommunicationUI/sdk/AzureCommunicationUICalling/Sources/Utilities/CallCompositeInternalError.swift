//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public enum CallCompositeInternalError: Error, Equatable {
  case deviceManagerFailed(Error?)
  case callJoinConnectionFailed
  case callTokenFailed
  case callJoinFailed
  case callEndFailed
  case callHoldFailed
  case callResumeFailed
  case callEvicted
  case callDenied
  case callJoinFailedByMicPermission
  case cameraSwitchFailed
  case cameraOnFailed
  case networkConnectionNotAvailable
  case micNotAvailable

  public var description: String {
    switch self {
    case .deviceManagerFailed:
      return "deviceManagerFailed"
    case .callJoinConnectionFailed:
      return "callJoinConnectionFailed"
    case .callTokenFailed:
      return "callTokenFailed"
    case .callJoinFailed:
      return "callJoinFailed"
    case .callEndFailed:
      return "callEndFailed"
    case .callHoldFailed:
      return "callHoldFailed"
    case .callResumeFailed:
      return "callResumeFailed"
    case .callEvicted:
      return "callEvicted"
    case .callDenied:
      return "callDenied"
    case .callJoinFailedByMicPermission:
      return "callJoinFailedByMicPermission"
    case .cameraSwitchFailed:
      return "cameraSwitchFailed"
    case .cameraOnFailed:
      return "cameraOnFailed"
    case .networkConnectionNotAvailable:
      return "networkConnectionNotAvailable"
    case .micNotAvailable:
      return "micNotAvailable"
    }
  }

  public func toCallCompositeErrorCode() -> String? {
    switch self {
    case .deviceManagerFailed:
      return CallCompositeErrorCode.cameraFailure
    case .callTokenFailed:
      return CallCompositeErrorCode.tokenExpired
    case .callJoinFailed, .callJoinConnectionFailed:
      return CallCompositeErrorCode.callJoin
    case .callEndFailed:
      return CallCompositeErrorCode.callEnd
    case .cameraOnFailed:
      return CallCompositeErrorCode.cameraFailure
    case .callJoinFailedByMicPermission:
      return CallCompositeErrorCode.microphonePermissionNotGranted
    case .networkConnectionNotAvailable:
      return CallCompositeErrorCode.networkConnectionNotAvailable
    case .callHoldFailed,
      .callResumeFailed,
      .callEvicted,
      .callDenied,
      .callJoinConnectionFailed,
      .micNotAvailable,
      .cameraSwitchFailed:
      return nil
    }
  }

  public func isFatalError() -> Bool {
    switch self {
    case .deviceManagerFailed,
      .callTokenFailed,
      .callJoinFailed,
      .callJoinFailedByMicPermission,
      .networkConnectionNotAvailable,
      .callEndFailed:
      return true
    case .callHoldFailed,
      .callResumeFailed,
      .callEvicted,
      .callDenied,
      .cameraSwitchFailed,
      .cameraOnFailed,
      .micNotAvailable,
      .callJoinConnectionFailed:
      return false
    }
  }
}

// swiftlint:disable:next extension_access_modifier
extension CallCompositeInternalError {
  public static func == (lhs: CallCompositeInternalError, rhs: CallCompositeInternalError) -> Bool {
    switch (lhs, rhs) {
    case (.deviceManagerFailed, .deviceManagerFailed),
      (.callJoinConnectionFailed, .callJoinConnectionFailed),
      (.callTokenFailed, .callTokenFailed),
      (.callJoinFailed, .callJoinFailed),
      (.callEndFailed, .callEndFailed),
      (.callHoldFailed, .callHoldFailed),
      (.callResumeFailed, .callResumeFailed),
      (.callEvicted, .callEvicted),
      (.callDenied, .callDenied),
      (.cameraSwitchFailed, .cameraSwitchFailed),
      (.networkConnectionNotAvailable, .networkConnectionNotAvailable),
      (.cameraOnFailed, .cameraOnFailed),
      (.micNotAvailable, .micNotAvailable):
      return true
    default:
      return false
    }
  }
}
