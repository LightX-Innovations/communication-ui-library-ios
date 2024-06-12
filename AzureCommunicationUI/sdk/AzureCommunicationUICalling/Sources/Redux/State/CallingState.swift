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
}

public enum OperationStatus: Int {
    case none
    case skipSetupRequested
    case callEndRequested
    case callEnded
}

public struct CallingState: Equatable, Encodable {
    let status: CallingStatus
    let operationStatus: OperationStatus
    let callId: String?
    let isRecordingActive: Bool
    let isTranscriptionActive: Bool
    let callStartDate: Date?

    init(status: CallingStatus = .none,
         operationStatus: OperationStatus = .none,
         callId: String? = nil,
         isRecordingActive: Bool = false,
         isTranscriptionActive: Bool = false,
         callStartDate: Date? = nil) {
        self.status = status
        self.operationStatus = operationStatus
        self.callId = callId
        self.isRecordingActive = isRecordingActive
        self.isTranscriptionActive = isTranscriptionActive
        self.callStartDate = callStartDate
    }

    public static func == (lhs: CallingState, rhs: CallingState) -> Bool {
        return (lhs.status == rhs.status
            && lhs.isRecordingActive == rhs.isRecordingActive
            && lhs.isTranscriptionActive == rhs.isTranscriptionActive)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.operationStatus, forKey: .operationStatus)
        try container.encode(self.callId, forKey: .callId)
        try container.encode(self.isRecordingActive, forKey: .isRecordingActive)
        try container.encode(self.isTranscriptionActive, forKey: .isTranscriptionActive)
        try container.encode(self.callStartDate, forKey: .callStartDate)
    }
}
