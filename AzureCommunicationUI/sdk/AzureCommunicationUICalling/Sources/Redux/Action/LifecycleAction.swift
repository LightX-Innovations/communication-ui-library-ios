//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public enum LifecycleAction: Equatable {
  case foregroundEntered
  case backgroundEntered
  case willTerminate
}
