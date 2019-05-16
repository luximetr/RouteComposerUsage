//
//  HistoryPresenter.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/15/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation
import RouteComposer

class HistoryPresenter: HistoryVCOutput {
  
  weak var output: HistoryVCInput?
  var context: MainTabBarContext!
  
  func didTapOnContinue() {
    try? DefaultRouter().navigate(to: RouteMap.historyDetailsScreen, with: context)
  }
}
