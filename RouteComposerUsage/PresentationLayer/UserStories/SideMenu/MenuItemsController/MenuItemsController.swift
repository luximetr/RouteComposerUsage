//
//  MenuItemsController.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/15/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation

public protocol MenuItemsController: class {
  var delegate: MenuItemsControllerDelegate? { get set }
}

public protocol MenuItemsControllerDelegate: class {
  func didSelectItem(at index: Int)
}
