//
//  ProfileEditingScreen.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/12/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation
import RouteComposer

class ProfileEditingVC: VC, ContextAccepting {
  
  typealias Context = MainTabBarContext
  
  var context: Context!
  
  func setup(with context: Context) throws {
    self.context = context
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func goToNextScreen() {
    context.profileContext.user = User(name: "Taras")
    try? router.navigate(to: RouteMap.profileSettingsScreen, with: context)
  }
}
