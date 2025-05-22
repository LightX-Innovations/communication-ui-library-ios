//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public enum CallingStatus: Int {
  case none
  case earlyMedia
  case connecting
  case ringing
  case connected
  case localHold
  case disconnecting
  case disconnected
  case inLobby
  case remoteHold

  public var description: String {
    switch self {
    case .none:
      return "none"
    case .earlyMedia:
      return "earlyMedia"
    case .connecting:
      return "connecting"
    case .ringing:
      return "ringing"
    case .connected:
      return "connected"
    case .localHold:
      return "localHold"
    case .disconnecting:
      return "disconnecting"
    case .disconnected:
      return "disconnected"
    case .inLobby:
      return "inLobby"
    case .remoteHold:
      return "remoteHold"

    }
  }

  public enum OperationStatus: Int {
    case none
    case skipSetupRequested
    case callEndRequested
    case callEnded

    public var description: String {
      switch self {
      case .none:
        return "none"
      case .skipSetupRequested:
        return "skipSetupRequested"
      case .callEndRequested:
        return "callEndRequested"
      case .callEnded:
        return "callEnded"
      }
    }
  }

  public enum RecordingStatus: Equatable {
    case on
    case off
    case stopped

    public var description: String {
      switch self {
      case .on:
        return "on"
      case .off:
        return "off"
      case .stopped:
        return "stopped"
      }
    }
  }

  struct CallingState: Equatable {
    let status: CallingStatus
    let operationStatus: OperationStatus
    let callId: String?
    let isRecordingActive: Bool
    let isTranscriptionActive: Bool
    let recordingStatus: RecordingStatus
    let transcriptionStatus: RecordingStatus
    let isRecorcingTranscriptionBannedDismissed: Bool
    let callStartDate: Date?
    let callEndReasonCode: Int?
    let callEndReasonSubCode: Int?
    /* <CALL_START_TIME>
    let callStartTime: Date?
    </CALL_START_TIME> */

    init(
      status: CallingStatus = .none,
      operationStatus: OperationStatus = .none,
      callId: String? = nil,
      isRecordingActive: Bool = false,
      isTranscriptionActive: Bool = false,
      callStartDate: Date? = nil,
      callEndReasonCode: Int? = nil,
      callEndReasonSubCode: Int? = nil,
      recordingStatus: RecordingStatus = RecordingStatus.off,
      transcriptionStatus: RecordingStatus = RecordingStatus.off,
      isRecorcingTranscriptionBannedDismissed: Bool = false,
      /* <CALL_START_TIME> */
      callStartTime: Date? = nil
        /* </CALL_START_TIME> */
    ) {
      self.status = status
      self.operationStatus = operationStatus
      self.callId = callId
      self.isRecordingActive = isRecordingActive
      self.isTranscriptionActive = isTranscriptionActive
      self.callStartDate = callStartDate
      self.callEndReasonCode = callEndReasonCode
      self.callEndReasonSubCode = callEndReasonSubCode
      self.recordingStatus = recordingStatus
      self.transcriptionStatus = transcriptionStatus
      self.isRecorcingTranscriptionBannedDismissed = isRecorcingTranscriptionBannedDismissed
      /* <CALL_START_TIME>
      self.callStartTime = callStartTime
      </CALL_START_TIME> */
    }

    static func == (lhs: CallingState, rhs: CallingState) -> Bool {
      return
        (lhs.status == rhs.status
        && lhs.isRecordingActive == rhs.isRecordingActive
        && lhs.isTranscriptionActive == rhs.isTranscriptionActive)
    }
  }
}

public enum OperationStatus: Int {
  case none
  case skipSetupRequested
  case callEndRequested
  case callEnded

  public var description: String {
    switch self {
    case .none:
      return "none"
    case .skipSetupRequested:
      return "skipSetupRequested"
    case .callEndRequested:
      return "callEndRequested"
    case .callEnded:
      return "callEnded"
    }
  }
}

public struct CallingState: Equatable {
  let status: CallingStatus
  let operationStatus: OperationStatus
  let callId: String?
  let isRecordingActive: Bool
  let isTranscriptionActive: Bool
  let callStartDate: Date?

  init(
    status: CallingStatus = .none,
    operationStatus: OperationStatus = .none,
    callId: String? = nil,
    isRecordingActive: Bool = false,
    isTranscriptionActive: Bool = false,
    callStartDate: Date? = nil
  ) {
    self.status = status
    self.operationStatus = operationStatus
    self.callId = callId
    self.isRecordingActive = isRecordingActive
    self.isTranscriptionActive = isTranscriptionActive
    self.callStartDate = callStartDate
  }

  public static func == (lhs: CallingState, rhs: CallingState) -> Bool {
    return
      (lhs.status == rhs.status
      && lhs.isRecordingActive == rhs.isRecordingActive
      && lhs.isTranscriptionActive == rhs.isTranscriptionActive)
  }

  public func toJson() -> [String: Any] {
    return [
      "status": self.status.description,
      "operationStatus": self.operationStatus.description,
      "callId": self.callId ?? "",
      "isRecordingActive": self.isRecordingActive,
      "isTranscriptionActive": self.isTranscriptionActive,
    ]
  }
}
