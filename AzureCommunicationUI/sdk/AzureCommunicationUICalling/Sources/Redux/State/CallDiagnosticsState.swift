//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

public struct CallDiagnosticsState: Equatable, Encodable {

    var networkDiagnostic: NetworkDiagnosticModel?
    var networkQualityDiagnostic: NetworkQualityDiagnosticModel?
    var mediaDiagnostic: MediaDiagnosticModel?

    init(networkDiagnostic: NetworkDiagnosticModel? = nil,
         networkQualityDiagnostic: NetworkQualityDiagnosticModel? = nil,
         mediaDiagnostic: MediaDiagnosticModel? = nil) {
        self.networkDiagnostic = networkDiagnostic
        self.networkQualityDiagnostic = networkQualityDiagnostic
        self.mediaDiagnostic = mediaDiagnostic
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.networkDiagnostic, forKey: .networkDiagnostic)
        try container.encode(self.networkQualityDiagnostic, forKey: .networkQualityDiagnostic)
        try container.encode(self.mediaDiagnostic, forKey: .mediaDiagnostic)
    }
}
