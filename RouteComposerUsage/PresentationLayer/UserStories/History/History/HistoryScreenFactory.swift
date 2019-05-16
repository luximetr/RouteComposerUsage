//
//  HistoryScreenFactory.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/15/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation
import RouteComposer

class HistoryScreenFactory: Factory {
  
  typealias ViewController = HistoryVC
  typealias Context = MainTabBarContext
  
  func build(with context: Context) throws -> ViewController {
    let vc = ViewController()
    let presenter = HistoryPresenter()
    vc.output = presenter
    presenter.output = vc
    presenter.context = context
    return vc
  }
}
