//
//  DashboardScreen.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/12/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation
import RouteComposer

class DashboardVC: VC, ContextAccepting {
  
  typealias Context = MainTabBarContext
  
  var context: Context!
  
  func setup(with context: MainTabBarContext) throws {
    self.context = context
  }
  
  override func goToNextScreen() {
    let specialization = Specialization()
    context.dashboardContext.specialization = specialization
    try? router.navigate(to: RouteMap.specializationScreen, with: context)
    
  }
}
