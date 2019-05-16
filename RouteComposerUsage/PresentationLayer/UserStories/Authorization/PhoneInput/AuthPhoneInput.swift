//
//  AuthPhoneInput.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/10/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import UIKit
import RouteComposer

class AuthPhoneInputVC: VC, ContextContained {
  
  typealias Context = AuthPhoneContext
  
  var context: AuthPhoneContext!
  
  override func goToNextScreen() {
    try? router.navigate(to: AuthorizationRouteMap.authPhoneConfirmScreen, with: context)
  }
  
}
