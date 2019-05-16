//
//  AuthorizationInterceptor.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/9/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation
import RouteComposer

class AuthorizationInterceptor<C>: RoutingInterceptor {
  
  typealias Context = C
  
  func execute(with context: Context, completion: @escaping (InterceptorResult) -> Void) {
    guard !ApplicationSettings.shared.haveAuthorizedUser else {
      completion(.continueRouting)
      return
    }
    
    let router = DefaultRouter()
    let authContext = AuthPhoneContext()
    authContext.interceptorCompletionBlock = completion
    try? router.navigate(to: AuthorizationRouteMap.authPhoneInputScreen, with: authContext)
  }
}
