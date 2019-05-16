//
//  PaymentCards.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/12/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation
import RouteComposer

struct User {
  let name: String
}

class PaymentCardsVC: VC, ContextAccepting {
  
  typealias Context = MainTabBarContext
  
  var context: Context!
  
  func setup(with context: Context) throws {
    self.context = context
  }
  
  override func goToNextScreen() { try? router.navigate(to: RouteMap.consultationReasonScreen, with: context) }
}
