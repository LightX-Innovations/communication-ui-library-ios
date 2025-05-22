//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import AzureCommunicationCalling
import Foundation

struct RemoteParticipantsState {
  let participantInfoList: [ParticipantInfoModel]
  let lastUpdateTimeStamp: Date
  let dominantSpeakers: [String]
  let dominantSpeakersModifiedTimestamp: Date
  let lobbyError: LobbyError?
  let totalParticipantCount: Int

  init(
    participantInfoList: [ParticipantInfoModel] = [],
    lastUpdateTimeStamp: Date = Date(),
    dominantSpeakers: [String] = [],
    dominantSpeakersModifiedTimestamp: Date = Date(),
    lobbyError: LobbyError? = nil,
    totalParticipantCount: Int = 0
  ) {
    self.participantInfoList = participantInfoList
    self.lastUpdateTimeStamp = lastUpdateTimeStamp
    self.dominantSpeakers = dominantSpeakers
    self.dominantSpeakersModifiedTimestamp = dominantSpeakersModifiedTimestamp
    self.lobbyError = lobbyError
    self.totalParticipantCount = totalParticipantCount
  }

  public func toJson() -> [String: Any] {
    var dominantSpeakersJson: [String] = []
    for dominantSpeaker in self.dominantSpeakers {
      dominantSpeakersJson.append(dominantSpeaker)
    }
    return [
      "participantInfoList": participantInfoListJson,
      "lastUpdateTimeStamp": self.lastUpdateTimeStamp.formatted(
        Date.ISO8601FormatStyle().dateSeparator(.dash)),
      "dominantSpeakers": dominantSpeakersJson,
      "dominantSpeakersModifiedTimestamp": self.dominantSpeakersModifiedTimestamp.formatted(
        Date.ISO8601FormatStyle().dateSeparator(.dash)),
      "lobbyError": self.lobbyError?.toJson() ?? [:],
    ]
  }
}

public struct LobbyError {
  let lobbyErrorCode: LobbyErrorCode
  let errorTimeStamp: Date

  public func toJson() -> [String: Any] {
    return [
      "lobbyErrorCode": self.lobbyErrorCode.description,
      "errorTimeStamp": self.errorTimeStamp.formatted(
        Date.ISO8601FormatStyle().dateSeparator(.dash)),
    ]
  }
}

public enum LobbyErrorCode {
  case lobbyDisabledByConfigurations
  case lobbyConversationTypeNotSupported
  case lobbyMeetingRoleNotAllowed
  case removeParticipantOperationFailure
  case unknownError

  public var description: String {
    switch self {
    case .lobbyDisabledByConfigurations:
      return "lobbyDisabledByConfigurations"
    case .lobbyConversationTypeNotSupported:
      return "lobbyConversationTypeNotSupported"
    case .lobbyMeetingRoleNotAllowed:
      return "lobbyMeetingRoleNotAllowed"
    case .removeParticipantOperationFailure:
      return "removeParticipantOperationFailure"
    case .unknownError:
      return "unknownError"
    }
  }

  public static func convertToLobbyErrorCode(_ error: NSError) -> LobbyErrorCode {
    switch CallingCommunicationErrors(rawValue: error.code) {
    case .lobbyDisabledByConfigurations:
      return .lobbyDisabledByConfigurations
    case .lobbyMeetingRoleNotAllowed:
      return .lobbyMeetingRoleNotAllowed
    case .lobbyConversationTypeNotSupported:
      return .lobbyConversationTypeNotSupported
    case .removeParticipantOperationFailure:
      return .removeParticipantOperationFailure
    default:
      return .unknownError
    }
  }
}
