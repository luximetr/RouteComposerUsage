//
//  ApplicationSettings.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/9/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation

class ApplicationSettings {
  
  static let shared = ApplicationSettings()
  
  var needShowTutorial = false
  var haveAuthorizedUser = false
  var needShowSideMenu = false
}
