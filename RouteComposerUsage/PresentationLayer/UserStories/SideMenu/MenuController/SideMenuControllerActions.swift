//
//  SideMenuControllerActions.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/15/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation
import RouteComposer

extension ContainerViewController where Self: SideMenuController {
  
  static func add(at index: Int = 0, replacing: Bool = false) -> SideMenuControllerActions.AddItemAction<Self> {
    return SideMenuControllerActions.AddItemAction(at: index, replacing: replacing)
  }
  
}

struct SideMenuControllerActions {
  
  struct AddItemAction<ViewController: SideMenuController>: ContainerAction {
    
    let tabIndex: Int?
    let replacing: Bool
    
    init(at tabIndex: Int, replacing: Bool = false) {
      self.tabIndex = tabIndex
      self.replacing = replacing
    }
    
    public func perform(with viewController: UIViewController, on existingController: ViewController, animated: Bool, completion: @escaping (ActionResult) -> Void) {
      existingController.containedViewControllers.append(viewController)
    }
  }
  
}
