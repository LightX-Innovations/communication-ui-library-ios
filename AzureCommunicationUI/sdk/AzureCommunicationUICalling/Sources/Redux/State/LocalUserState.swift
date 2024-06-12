//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public struct LocalUserState: Encodable {
    public enum CameraOperationalStatus: Equatable, String, CodingKey {
        case on
        case off
        case paused
        case pending

        public static func == (lhs: LocalUserState.CameraOperationalStatus,
                               rhs: LocalUserState.CameraOperationalStatus
        ) -> Bool {
            switch (lhs, rhs) {
            case (.on, .on),
                 (.off, .off),
                 (.paused, paused),
                 (.pending, .pending):
                return true
            default:
                return false
            }
        }
    }

    public enum CameraDeviceSelectionStatus: Equatable, String, CodingKey {
        case front
        case back
        case switching

        public static func == (lhs: LocalUserState.CameraDeviceSelectionStatus,
                               rhs: LocalUserState.CameraDeviceSelectionStatus) -> Bool {
            switch (lhs, rhs) {
            case (.front, .front),
                 (.back, .back),
                 (.switching, switching):
                return true
            default:
                return false
            }
        }
    }

    public enum CameraTransmissionStatus: Equatable, String, CodingKey {
        case local
        case remote

        public static func == (lhs: LocalUserState.CameraTransmissionStatus,
                               rhs: LocalUserState.CameraTransmissionStatus) -> Bool {
            switch (lhs, rhs) {
            case (.local, .local),
                 (.remote, .remote):
                return true
            default:
                return false
            }
        }
    }

    public enum AudioOperationalStatus: Equatable, String, CodingKey {
        case on
        case off
        case pending

        public static func == (lhs: LocalUserState.AudioOperationalStatus,
                               rhs: LocalUserState.AudioOperationalStatus) -> Bool {
            switch (lhs, rhs) {
            case (.on, .on),
                 (.off, .off),
                 (.pending, .pending):
                return true
            default:
                return false
            }
        }
    }

    public enum AudioDeviceSelectionStatus: Equatable, String, CodingKey {
        case speakerSelected
        case speakerRequested
        case receiverSelected
        case receiverRequested
        case bluetoothSelected
        case bluetoothRequested
        case headphonesSelected
        case headphonesRequested

        public static func == (lhs: LocalUserState.AudioDeviceSelectionStatus,
                               rhs: LocalUserState.AudioDeviceSelectionStatus) -> Bool {
            switch (lhs, rhs) {
            case (.speakerSelected, .speakerSelected),
                 (.speakerRequested, .speakerRequested),
                 (.receiverSelected, receiverSelected),
                 (.receiverRequested, .receiverRequested),
                 (.bluetoothSelected, bluetoothSelected),
                 (.bluetoothRequested, .bluetoothRequested),
                 (.headphonesSelected, headphonesSelected),
                 (.headphonesRequested, .headphonesRequested):
                return true
            default:
                return false
            }
        }

        public static func isSelected(for audioDeviceStatus: LocalUserState.AudioDeviceSelectionStatus) -> Bool {
            switch audioDeviceStatus {
            case .speakerSelected, .receiverSelected, .bluetoothSelected, .headphonesSelected:
                return true
            default:
                return false
            }
        }
    }

    public struct CameraState: Encodable {
        let operation: CameraOperationalStatus
        let device: CameraDeviceSelectionStatus
        let transmission: CameraTransmissionStatus
        var error: Error?

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(self.operation, forKey: .operation)
            try container.encode(self.device, forKey: .device)
            try container.encode(self.transmission, forKey: .transmission)
            try container.encode(self.error, forKey: .error)
        }
    }

    public struct AudioState: Encodable {
        let operation: AudioOperationalStatus
        let device: AudioDeviceSelectionStatus
        var error: Error?

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(operation, forKey: .operation)
            try container.encode(device, forKey: .device)
            try container.encode(error, forKey: .error)
        }
    }

    let cameraState: CameraState
    let audioState: AudioState
    let displayName: String?
    let localVideoStreamIdentifier: String?
    let participantRole: ParticipantRole?

    init(cameraState: CameraState = CameraState(operation: .off,
                                                device: .front,
                                                transmission: .local),
         audioState: AudioState = AudioState(operation: .off,
                                             device: .receiverSelected),
         displayName: String? = nil,
         localVideoStreamIdentifier: String? = nil,
         participantRole: ParticipantRole? = nil) {
        self.cameraState = cameraState
        self.audioState = audioState
        self.displayName = displayName
        self.localVideoStreamIdentifier = localVideoStreamIdentifier
        self.participantRole = participantRole
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.cameraState, forKey: .cameraState)
        try container.encode(self.audioState, forKey: .audioState)
        try container.encode(self.displayName, forKey: .displayName)
        try container.encode(self.localVideoStreamIdentifier, forKey: .localVideoStreamIdentifier)
        try container.encode(self.participantRole, forKey: .participantRole)
    }
}
