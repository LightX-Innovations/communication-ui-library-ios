//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation
import AzureCommunicationCalling

public struct CapabilitiesChangedEvent: Equatable {
    public static func == (lhs: CapabilitiesChangedEvent, rhs: CapabilitiesChangedEvent) -> Bool {
        if lhs.capabilitiesChangedReason == rhs.capabilitiesChangedReason
            && lhs.changedCapabilities == rhs.changedCapabilities {
            return true
        } else {
            return false
        }
    }

    let changedCapabilities: [ParticipantCapability]
    let capabilitiesChangedReason: CapabilitiesChangedReason
}

extension AzureCommunicationCalling.CapabilitiesChangedEventArgs {
    func toCapabilitiesChangedEvent() -> CapabilitiesChangedEvent {
        return CapabilitiesChangedEvent(
            changedCapabilities: self.changedCapabilities.compactMap { $0.toParticipantCapability() },
            capabilitiesChangedReason: self.reason.toCapabilitiesChangedReason())
    }
}
