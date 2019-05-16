//
//  TariffSelectScreen.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/14/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation
import RouteComposer

class TariffSelectVC: VC, ContextAccepting {
  
  typealias Context = MainTabBarContext
  
  var context: Context!
  
  func setup(with context: Context) throws {
    self.context = context
  }
  
  override func goToNextScreen() { try? router.navigate(to: RouteMap.paymentCardsScreen, with: context) }
}
