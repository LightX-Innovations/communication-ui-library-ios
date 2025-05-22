//
//  Copyright (c) Microsoft Corporation. All rights reserved.
//  Licensed under the MIT License.
//

import UIKit

extension UIWindow {

    static var keyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first { $0.isKeyWindow }
    }

    var hasViewController = false
    if !viewController.children.isEmpty {
      viewController.children.forEach {
        if UIWindow.hasViewController(ofKind: kind, fromViewController: $0) {
          hasViewController = true
        }
      }
    }

    if let presented = viewController.presentedViewController,
      UIWindow.hasViewController(ofKind: kind, fromViewController: presented)
    {
      hasViewController = true
    }

    return hasViewController
  }

}
