//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Foundation

public struct DefaultUserState {
  public enum CameraState: Equatable {
    case on
    case off
  }

  public enum AudioState: Equatable {
    case on
    case off
  }

  let cameraState: CameraState
  let audioState: AudioState

  init(
    cameraState: CameraState = .off,
    audioState: AudioState = .off
  ) {
    self.cameraState = cameraState
    self.audioState = audioState
  }
}
