//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public enum ParticipantStatus: Int {
  case idle
  case earlyMedia
  case connecting
  case connected
  case hold
  case inLobby
  case disconnected
  case ringing

  public var description: String {
    switch self {
    case .idle:
      return "idle"
    case .earlyMedia:
      return "earlyMedia"
    case .connecting:
      return "connecting"
    case .connected:
      return "connected"
    case .hold:
      return "hold"
    case .inLobby:
      return "inLobby"
    case .disconnected:
      return "disconnected"
    case .ringing:
      return "ringing"
    }
  }
}

public struct ParticipantInfoModel: Hashable, Equatable {
  let displayName: String
  let isSpeaking: Bool
  let isMuted: Bool

  let isRemoteUser: Bool
  let userIdentifier: String
  let status: ParticipantStatus

  let screenShareVideoStreamModel: VideoStreamInfoModel?
  let cameraVideoStreamModel: VideoStreamInfoModel?

  public func toJson() -> [String: Any] {
    var json: [String: Any] = [
      "displayName": self.displayName,
      "isSpeaking": self.isSpeaking,
      "isMuted": self.isMuted,
      "isRemoteUser": self.isRemoteUser,
      "userIdentifier": self.userIdentifier,
      "status": self.status.description,
    ]

    if let screenShareVideoStreamModel = self.screenShareVideoStreamModel {
      json["screenShareVideoStreamModel"] = screenShareVideoStreamModel.toJson()
    }

    if let cameraVideoStreamModel = self.cameraVideoStreamModel {
      json["cameraVideoStreamModel"] = cameraVideoStreamModel.toJson()
    }

    return json
  }

}
