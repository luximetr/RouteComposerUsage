//
//  AuthorizationRouteMap.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/9/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation
import RouteComposer

class AuthPhoneContext {
  var interceptorCompletionBlock: ((_: InterceptorResult) -> Void)?
}

class AuthorizationRouteMap {
  
  class var authPhoneInputScreen: DestinationStep<AuthPhoneInputVC, AuthPhoneContext> {
    return StepAssembly(
      finder: ClassFinder<AuthPhoneInputVC, AuthPhoneContext>(),
      factory: ContextVCFactory<AuthPhoneInputVC, AuthPhoneContext>())
      .using(UINavigationController.pushAsRoot())
      .from(NavigationControllerStep())
      .using(GeneralAction.presentModally())
      .from(GeneralStep.current())
      .assemble()
  }
  
  class var authPhoneConfirmScreen: DestinationStep<AuthPhoneConfirmVC, AuthPhoneContext> {
    return StepAssembly(
      finder: ClassFinder<AuthPhoneConfirmVC, AuthPhoneContext>(),
      factory: ContextVCFactory<AuthPhoneConfirmVC, AuthPhoneContext>())
      .using(UINavigationController.push())
      .from(authPhoneInputScreen.expectingContainer())
      .assemble()
  }
  
  class var afterDeAuthScreen: DestinationStep<AuthPhoneInputVC, AuthPhoneContext> {
    return StepAssembly(
      finder: ClassFinder(),
      factory: ContextVCFactory<AuthPhoneInputVC, AuthPhoneContext>())
      .using(UINavigationController.pushAsRoot())
      .from(NavigationControllerStep())
      .using(GeneralAction.replaceRootPresental())
      .from(GeneralStep.root())
      .assemble()
  }
}
