//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import Combine
import FluentUI
import Foundation

class PrimaryButtonViewModel: ObservableObject {
  @Published var isDisabled: Bool
  @Published var accessibilityLabel: String?
  let buttonStyle: FluentUI.ButtonStyle
  let buttonLabel: String
  let iconName: CompositeIcon?
  let paddings: CompositeButton.Paddings?
  var action: (() -> Void)

  init(
    buttonStyle: FluentUI.ButtonStyle,
    buttonLabel: String,
    iconName: CompositeIcon? = nil,
    isDisabled: Bool = false,
    paddings: CompositeButton.Paddings? = nil,
    action: @escaping (() -> Void) = {}
  ) {
    self.buttonStyle = buttonStyle
    self.buttonLabel = buttonLabel
    self.iconName = iconName
    self.isDisabled = isDisabled
    self.action = action
    self.paddings = paddings
  }

  func update(isDisabled: Bool) {
    if self.isDisabled != isDisabled {
      self.isDisabled = isDisabled
    }
  }

  func update(accessibilityLabel: String?) {
    if self.accessibilityLabel != accessibilityLabel {
      self.accessibilityLabel = accessibilityLabel
    }
  }
}
