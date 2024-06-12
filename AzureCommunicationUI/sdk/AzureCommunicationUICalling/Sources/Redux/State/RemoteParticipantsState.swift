//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

import AzureCommunicationCalling

public struct RemoteParticipantsState: Encodable {
    let participantInfoList: [ParticipantInfoModel]
    let lastUpdateTimeStamp: Date
    let dominantSpeakers: [String]
    let dominantSpeakersModifiedTimestamp: Date
    let lobbyError: LobbyError?

    init(participantInfoList: [ParticipantInfoModel] = [],
         lastUpdateTimeStamp: Date = Date(),
         dominantSpeakers: [String] = [],
         dominantSpeakersModifiedTimestamp: Date = Date(),
         lobbyError: LobbyError? = nil) {
        self.participantInfoList = participantInfoList
        self.lastUpdateTimeStamp = lastUpdateTimeStamp
        self.dominantSpeakers = dominantSpeakers
        self.dominantSpeakersModifiedTimestamp = dominantSpeakersModifiedTimestamp
        self.lobbyError = lobbyError
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(participantInfoList, forKey: .participantInfoList)
        try container.encode(lastUpdateTimeStamp, forKey: .lastUpdateTimeStamp)
        try container.encode(dominantSpeakers, forKey: .dominantSpeakers)
        try container.encode(dominantSpeakersModifiedTimestamp, forKey: .dominantSpeakersModifiedTimestamp)
        try container.encode(lobbyError, forKey: .lobbyError)
    }
}

public struct LobbyError: Encodable {
    let lobbyErrorCode: LobbyErrorCode
    let errorTimeStamp: Date

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(lobbyErrorCode, forKey: .lobbyErrorCode)
        try container.encode(errorTimeStamp, forKey: .errorTimeStamp)
    }
}

public enum LobbyErrorCode {
    case lobbyDisabledByConfigurations
    case lobbyConversationTypeNotSupported
    case lobbyMeetingRoleNotAllowed
    case removeParticipantOperationFailure
    case unknownError

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
