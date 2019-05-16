//
//  Specialization.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/11/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation
import RouteComposer

struct Specialization {
  
}

class SpecializationVC: VC, ContextAccepting {
  
  typealias Context = MainTabBarContext
  
  var context: Context!
  
  func setup(with context: Context) throws {
    self.context = context
  }
  
  override func goToNextScreen() { try? router.navigate(to: RouteMap.tariffSelectScreen, with: context) }
}
