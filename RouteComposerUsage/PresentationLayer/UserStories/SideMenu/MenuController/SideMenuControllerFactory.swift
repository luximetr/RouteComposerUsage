//
//  SideMenuControllerFactory.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/14/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import UIKit
import RouteComposer

// SMC = SideMenuController
// MIL = MenuItemsList
struct SideMenuControllerFactory<SMC: SideMenuController, C>: ContainerFactory {
  
  typealias ViewController = SMC
  typealias Context = C
  
  private let menuItemsListVCFactory: SimpleMenuItemsVCFactory<C>
  private let menuItemsListVCContext: SimpleMenuItemsVCFactory<C>.Context
  
  init(menuItemsListVCFactory: SimpleMenuItemsVCFactory<C>,
       menuItemsListVCContext: SimpleMenuItemsVCFactory<C>.Context) {
    self.menuItemsListVCFactory = menuItemsListVCFactory
    self.menuItemsListVCContext = menuItemsListVCContext
  }
  
  func build(with context: C, integrating coordinator: ChildCoordinator<C>) throws -> SMC {
    guard let menuItemsListVC = try? menuItemsListVCFactory.build(with: menuItemsListVCContext) else {
      throw RoutingError.compositionFailed(.init("Unable to build MenuItemsListController in SideMenuControllerFactory"))
    }
    
    let sideMenuController = SMC.init(rootViewController: nil)
    sideMenuController.leftViewController = menuItemsListVC
    sideMenuController.leftViewWidth = UIScreen.main.bounds.width - 118
    menuItemsListVC.delegate = sideMenuController
    
    guard let viewControllers = try? coordinator.build(with: context) else {
      throw RoutingError.compositionFailed(.init("Unable to build view controllers in SideMenuControllerFactory"))
    }
    
    sideMenuController.containedViewControllers = viewControllers
    if let firstViewController = viewControllers.first {
      sideMenuController.rootViewController = firstViewController
      sideMenuController.makeVisible(firstViewController, animated: false)
    }
    
    return sideMenuController
  }
}


