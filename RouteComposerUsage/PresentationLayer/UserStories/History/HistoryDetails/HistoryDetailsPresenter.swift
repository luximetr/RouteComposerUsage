//
//  HistoryDetailsPresenter.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/15/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation
import RouteComposer

class HistoryDetailsPresenter: HistoryVCOutput {
  
  var output: HistoryVCInput?
  
  func didTapOnContinue() {
    try? DefaultRouter().navigate(to: RouteMap.needUpdateScreen, with: nil)
  }
}
