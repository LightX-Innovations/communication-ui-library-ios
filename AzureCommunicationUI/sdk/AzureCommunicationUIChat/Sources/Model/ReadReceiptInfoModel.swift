//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import AzureCommunicationCommon
import AzureCore
import Foundation

struct ReadReceiptInfoModel: BaseInfoModel, Equatable {
  let senderIdentifier: CommunicationIdentifier
  let chatMessageId: String
  let readOn: Iso8601Date

    static func == (lhs: ReadReceiptInfoModel, rhs: ReadReceiptInfoModel) -> Bool {
        return lhs.chatMessageId == rhs.chatMessageId
    }
}
