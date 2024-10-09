//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

public enum NetworkCallDiagnostic: String, CaseIterable, Equatable {
  case networkUnavailable
  case networkRelaysUnreachable
}

public enum NetworkQualityCallDiagnostic: String, CaseIterable, Equatable {
  case networkReconnectionQuality
  case networkReceiveQuality
  case networkSendQuality
}

public enum MediaCallDiagnostic: String, CaseIterable, Equatable {
  case speakerNotFunctioning
  case speakerBusy
  case speakerMuted
  case speakerVolumeZero
  case noSpeakerDevicesAvailable
  case speakingWhileMicrophoneIsMuted
  case noMicrophoneDevicesAvailable
  case microphoneBusy
  case cameraFrozen
  case cameraStartFailed
  case cameraStartTimedOut
  case microphoneNotFunctioning
  case microphoneMutedUnexpectedly
  case cameraPermissionDenied
}

public struct CallDiagnosticModel<DiagnosticKind, Value>: Equatable
where DiagnosticKind: Equatable, Value: Equatable {

  var diagnostic: DiagnosticKind
  var value: Value
}

public enum CallDiagnosticQuality: Int {
  case unknown
  case good
  case poor
  case bad
}

public typealias NetworkQualityDiagnosticModel =
  CallDiagnosticModel<NetworkQualityCallDiagnostic, CallDiagnosticQuality>

public typealias NetworkDiagnosticModel = CallDiagnosticModel<NetworkCallDiagnostic, Bool>

public typealias MediaDiagnosticModel = CallDiagnosticModel<MediaCallDiagnostic, Bool>
