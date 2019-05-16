//
//  ReplaceRootPresentalAction.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/14/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation
import RouteComposer

extension GeneralAction {
  
  public static func replaceRootPresental() -> ReplaceRootPresentalAction {
    return ReplaceRootPresentalAction()
  }
}

public struct ReplaceRootPresentalAction: Action {
  
  public func perform(with viewController: UIViewController,
                      on existingController: UIViewController,
                      animated: Bool,
                      completion: @escaping (ActionResult) -> Void) {
    guard let window = KeyWindowProvider().window else {
      completion(.failure(RoutingError.compositionFailed(.init("Window was not found."))))
      return
    }
    guard animated, let snapshotView = existingController.view.snapshotView(afterScreenUpdates: false) else {
      window.rootViewController = viewController
      window.makeKeyAndVisible()
      return completion(.continueRouting)
    }
    window.rootViewController = viewController
    window.makeKeyAndVisible()
    viewController.view.addSubview(snapshotView)
    snapshotView.frame = UIScreen.main.bounds
    UIView.animate(withDuration: 1, animations: {
      snapshotView.frame = CGRect(origin: CGPoint(x: 0, y: UIScreen.main.bounds.height), size: existingController.view.frame.size)
    }) { _ in
      snapshotView.removeFromSuperview()
      completion(.continueRouting)
    }
  }
}
