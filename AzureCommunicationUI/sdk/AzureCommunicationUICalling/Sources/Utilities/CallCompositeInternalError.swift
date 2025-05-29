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
    case captionsNotActive
    case captionsStartFailedSpokenLanguageNotSupported
    case captionsStartFailedCallNotConnected

    public var description: String {
        switch self {
        case .deviceManagerFailed(let error):
            return "Device manager failed with error: \(error?.localizedDescription ?? "Unknown error")"
        case .callJoinConnectionFailed:
            return "Call join connection failed"
        case .callTokenFailed:
            return "Call token failed"
        case .callJoinFailed:
            return "Call join failed"
        case .callEndFailed:
            return "Call end failed"
        case .callHoldFailed:
            return "Call hold failed"
        case .callResumeFailed:
            return "Call resume failed"
        case .callEvicted:
            return "Call evicted"
        case .callDenied:
            return "Call denied"
        case .callJoinFailedByMicPermission:
            return "Call join failed due to microphone permission not granted"
        case .cameraSwitchFailed:
            return "Camera switch failed"
        case .cameraOnFailed:
            return "Camera on failed"
        case .networkConnectionNotAvailable:
            return "Network connection not available"
        case .micNotAvailable:
            return "Microphone not available"
        case .captionsNotActive:
            return "Captions not active"
        case .captionsStartFailedSpokenLanguageNotSupported:
            return "Captions start failed due to spoken language not supported"
        case .captionsStartFailedCallNotConnected:
            return "Captions start failed because call is not connected"
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
        case .captionsNotActive:
            return CallCompositeErrorCode.captionsNotActive
        case .captionsStartFailedCallNotConnected:
            return CallCompositeErrorCode.captionsStartFailedCallNotConnected
        case .captionsStartFailedSpokenLanguageNotSupported:
            return CallCompositeErrorCode.captionsStartFailedSpokenLanguageNotSupported
        case .callHoldFailed,
                .callResumeFailed,
                .callEvicted,
                .callDenied,
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
                .captionsNotActive,
                .captionsStartFailedCallNotConnected,
                .captionsStartFailedSpokenLanguageNotSupported,
                .callJoinConnectionFailed:
            return false
        }
    }
}

extension CallCompositeInternalError {
    public static func == (lhs: CallCompositeInternalError, rhs: CallCompositeInternalError) -> Bool {
        switch(lhs, rhs) {
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
            (.micNotAvailable, .micNotAvailable),
            (.captionsNotActive, .captionsNotActive),
            (.captionsStartFailedSpokenLanguageNotSupported, .captionsStartFailedSpokenLanguageNotSupported),
            (.captionsStartFailedCallNotConnected, .captionsStartFailedCallNotConnected):
            return true
        default:
            return false
        }
    }
}
