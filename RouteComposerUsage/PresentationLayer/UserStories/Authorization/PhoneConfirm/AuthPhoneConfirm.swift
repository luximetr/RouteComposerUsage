//
//  AuthPhoneConfirm.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/10/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation

class AuthPhoneConfirmVC: VC, ContextContained {
  
  typealias Context = AuthPhoneContext
  
  var context: AuthPhoneContext!
  
  override func goToNextScreen() {
    ApplicationSettings.shared.haveAuthorizedUser = true
    if let interceptorCompletionBlock = context.interceptorCompletionBlock {
      interceptorCompletionBlock(.continueRouting)
    } else {
      try? router.navigate(to: RouteMap.mainTabBarScreen, with: MainTabBarContext())
    }
  }
}
