//
//  HistoryScreen.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/14/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation
import RouteComposer

protocol HistoryVCInput: class {
  
}

protocol HistoryVCOutput {
  func didTapOnContinue()
}

class HistoryVC: VC, HistoryVCInput {
  
  var output: HistoryVCOutput!
  
  override func goToNextScreen() {
    output.didTapOnContinue()
  }
}
