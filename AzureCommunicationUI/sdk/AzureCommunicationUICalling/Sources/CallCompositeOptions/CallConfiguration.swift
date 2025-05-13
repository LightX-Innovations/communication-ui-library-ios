//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import AzureCommunicationCommon
import Foundation

public struct CallConfiguration {
  let groupId: UUID?
  let meetingLink: String?
  let roomId: String?
  let compositeCallType: CompositeCallType
  let credential: CommunicationTokenCredential
  let displayName: String?
  let diagnosticConfig: DiagnosticConfig

  init(
    locator: JoinLocator,
    credential: CommunicationTokenCredential,
    displayName: String?
  ) {
    switch locator {
    case let .groupCall(groupId: groupId):
      self.groupId = groupId
      self.meetingLink = nil
      self.roomId = nil
      self.compositeCallType = .groupCall
    case let .teamsMeeting(teamsLink: meetingLink):
      self.groupId = nil
      self.meetingLink = meetingLink
      self.roomId = nil
      self.compositeCallType = .teamsMeeting
    case let .roomCall(roomId: roomId):
      self.groupId = nil
      self.meetingLink = nil
      self.roomId = roomId
      self.compositeCallType = .roomCall
    }
    self.credential = credential
    self.displayName = displayName
    self.diagnosticConfig = DiagnosticConfig()
  }
}

public enum CompositeCallType {
  case groupCall
  case teamsMeeting
  case roomCall
}
