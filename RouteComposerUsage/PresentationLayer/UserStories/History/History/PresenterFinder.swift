//
//  PresenterFinder.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/15/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation
import RouteComposer

class HistoryDetailsScreenFinder<C>: StackIteratingFinder {
  
  typealias ViewController = HistoryVC
  typealias Context = C
  
  public let iterator: StackIterator = DefaultStackIterator(options: .currentAllStack)
  
  func isTarget(_ viewController: HistoryVC, with context: C) -> Bool {
    return viewController.output is HistoryDetailsPresenter
  }
}
