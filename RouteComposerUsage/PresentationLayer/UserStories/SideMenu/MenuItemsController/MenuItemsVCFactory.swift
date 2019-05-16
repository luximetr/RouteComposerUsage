//
//  MenuItemsVCFactory.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/15/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation
import RouteComposer

protocol MenuItemsVCFactory: Factory where ViewController: MenuItemsController {

}

class SimpleMenuItemsVCFactory<C>: MenuItemsVCFactory {
  
  typealias ViewController = MenuItemsVC
  
  typealias Context = C
  
  func build(with context: C) throws -> MenuItemsVC {
    return MenuItemsVC()
  }
}
