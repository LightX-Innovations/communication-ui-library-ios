//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public enum ErrorCategory {
    case fatal
    case callState
    case none
}

public struct ErrorState: Equatable, Encodable {
    // errorType would be nil for no error status
    let internalError: CallCompositeInternalError?
    let error: Error?
    let errorCategory: ErrorCategory

    init(internalError: CallCompositeInternalError? = nil,
         error: Error? = nil,
         errorCategory: ErrorCategory = .none) {
        self.internalError = internalError
        self.error = error
        self.errorCategory = errorCategory
    }

    public static func == (lhs: ErrorState, rhs: ErrorState) -> Bool {
        return (lhs.internalError == rhs.internalError)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.internalError, forKey: .internalError)
        try container.encode(self.error, forKey: .error)
        try container.encode(self.errorCategory, forKey: .errorCategory)
    }
}
