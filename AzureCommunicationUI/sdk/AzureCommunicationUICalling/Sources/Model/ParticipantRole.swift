//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import AzureCommunicationCalling
import Foundation

public enum ParticipantRole: Int {
  case uninitialized
  case attendee
  case consumer
  case presenter
  case organizer
  case coOrganizer

  public var description: String {
    switch self {
    case .uninitialized:
      return "uninitialized"
    case .attendee:
      return "attendee"
    case .consumer:
      return "consumer"
    case .presenter:
      return "presenter"
    case .organizer:
      return "organizer"
    case .coOrganizer:
      return "coOrganizer"
    }
  }
}

extension AzureCommunicationCalling.CallParticipantRole {
  func toParticipantRole() -> ParticipantRole {
    switch self {
    case .attendee:
      return .attendee
    case .uninitialized:
      return .uninitialized
    case .consumer:
      return .consumer
    case .presenter:
      return .presenter
    case .organizer:
      return .organizer
    case .coOrganizer:
      return .coOrganizer
    }
  }
}
