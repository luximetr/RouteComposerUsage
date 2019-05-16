//
//  GuestProfileScreen.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/14/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation

class GuestProfileVC: VC {
  
  override func goToNextScreen() {
    try? router.navigate(to: RouteMap.guestProfileSettingsScreens, with: MainTabBarContext())
  }
}
