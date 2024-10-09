//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public struct LocalUserState {
  public enum CameraOperationalStatus: Equatable {
    case on
    case off
    case paused
    case pending

    public var description: String {
      switch self {
      case .on:
        return "on"
      case .off:
        return "off"
      case .paused:
        return "paused"
      case .pending:
        return "pending"
      }
    }

    public static func == (
      lhs: LocalUserState.CameraOperationalStatus,
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

  public enum CameraDeviceSelectionStatus: Equatable {
    case front
    case back
    case switching

    public var description: String {
      switch self {
      case .front:
        return "front"
      case .back:
        return "back"
      case .switching:
        return "switching"
      }
    }

    public static func == (
      lhs: LocalUserState.CameraDeviceSelectionStatus,
      rhs: LocalUserState.CameraDeviceSelectionStatus
    ) -> Bool {
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

  public enum CameraTransmissionStatus: Equatable {
    case local
    case remote

    public var description: String {
      switch self {
      case .local:
        return "local"
      case .remote:
        return "remote"
      }
    }

    public static func == (
      lhs: LocalUserState.CameraTransmissionStatus,
      rhs: LocalUserState.CameraTransmissionStatus
    ) -> Bool {
      switch (lhs, rhs) {
      case (.local, .local),
        (.remote, .remote):
        return true
      default:
        return false
      }
    }
  }

  public enum AudioOperationalStatus: Equatable {
    case on
    case off
    case pending

    public var description: String {
      switch self {
      case .on:
        return "on"
      case .off:
        return "off"
      case .pending:
        return "pending"
      }
    }

    public static func == (
      lhs: LocalUserState.AudioOperationalStatus,
      rhs: LocalUserState.AudioOperationalStatus
    ) -> Bool {
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

  public enum AudioDeviceSelectionStatus: Equatable {
    case speakerSelected
    case speakerRequested
    case receiverSelected
    case receiverRequested
    case bluetoothSelected
    case bluetoothRequested
    case headphonesSelected
    case headphonesRequested

    public var description: String {
      switch self {
      case .speakerSelected:
        return "speakerSelected"
      case .speakerRequested:
        return "speakerRequested"
      case .receiverSelected:
        return "receiverSelected"
      case .receiverRequested:
        return "receiverRequested"
      case .bluetoothSelected:
        return "bluetoothSelected"
      case .bluetoothRequested:
        return "bluetoothRequested"
      case .headphonesSelected:
        return "headphonesSelected"
      case .headphonesRequested:
        return "headphonesRequested"
      }
    }

    public static func == (
      lhs: LocalUserState.AudioDeviceSelectionStatus,
      rhs: LocalUserState.AudioDeviceSelectionStatus
    ) -> Bool {
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

    public static func isSelected(for audioDeviceStatus: LocalUserState.AudioDeviceSelectionStatus)
      -> Bool
    {
      switch audioDeviceStatus {
      case .speakerSelected, .receiverSelected, .bluetoothSelected, .headphonesSelected:
        return true
      default:
        return false
      }
    }
  }

  public struct CameraState {
    let operation: CameraOperationalStatus
    let device: CameraDeviceSelectionStatus
    let transmission: CameraTransmissionStatus
    var error: Error?

    public func toJson() -> [String: Any] {
      return [
        "operation": self.operation.description,
        "device": self.device.description,
        "transmission": self.transmission.description,
        "error": self.error?.localizedDescription ?? "",
      ]
    }
  }

  public struct AudioState {
    let operation: AudioOperationalStatus
    let device: AudioDeviceSelectionStatus
    var error: Error?

    public func toJson() -> [String: Any] {
      return [
        "operation": self.operation.description,
        "device": self.device.description,
        "error": self.error?.localizedDescription ?? "",
      ]
    }
  }

  let cameraState: CameraState
  let audioState: AudioState
  let displayName: String?
  let localVideoStreamIdentifier: String?
  let participantRole: ParticipantRole?
  let transforms: [CameraTransforms<Any>]?

  init(
    cameraState: CameraState = CameraState(
      operation: .off,
      device: .front,
      transmission: .local),
    audioState: AudioState = AudioState(
      operation: .off,
      device: .receiverSelected),
    displayName: String? = nil,
    localVideoStreamIdentifier: String? = nil,
    participantRole: ParticipantRole? = nil,
    transforms: [CameraTransforms<Any>]? = nil
  ) {
    self.cameraState = cameraState
    self.audioState = audioState
    self.displayName = displayName
    self.localVideoStreamIdentifier = localVideoStreamIdentifier
    self.participantRole = participantRole
    self.transforms = transforms
  }

  public func toJson() -> [String: Any] {
    return [
      "cameraState": self.cameraState.toJson(),
      "audioState": self.audioState.toJson(),
      "displayName": self.displayName ?? "",
      "localVideoStreamIdentifier": self.localVideoStreamIdentifier ?? "",
      "participantRole": self.participantRole?.description ?? "",
    ]
  }
}
