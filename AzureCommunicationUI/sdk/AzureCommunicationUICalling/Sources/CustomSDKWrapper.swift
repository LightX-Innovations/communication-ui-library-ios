//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

public class CustomSDKWrapper: CallingSDKWrapper {
    override
    public init(logger: Logger,
         callingEventsHandler: CallingSDKEventsHandling,
         callConfiguration: CallConfiguration) {
        super.init(logger: logger, callingEventsHandler: callingEventsHandler, callConfiguration: callConfiguration)
    }
}
