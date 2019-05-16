//
//  AppDelegate.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/6/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import UIKit
import RouteComposer

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  let router = DefaultRouter()


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    self.window = window
    window.rootViewController = UIViewController()
    window.makeKeyAndVisible()
    
    if ApplicationSettings.shared.needShowTutorial {
      try? router.navigate(to: RouteMap.tutorialScreen, with: nil)
    } else if ApplicationSettings.shared.haveAuthorizedUser {
      try? router.navigate(to: RouteMap.checkStateScreen, with: nil)
    } else if ApplicationSettings.shared.needShowSideMenu {
      try? router.navigate(to: RouteMap.sideMenuScreen, with: MainTabBarContext())
    } else {
      try? router.navigate(to: RouteMap.mainTabBarScreen, with: MainTabBarContext())
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
//      self.pushReceived()
//      self.presentPushReceived()
    })
    
    return true
  }
  
  private func pushReceived() {
    let context = MainTabBarContext()
    context.profileContext.user = User(name: "Petro")
    context.profileContext.language = .ru
    try? router.navigate(to: RouteMap.profileSettingsScreen, with: context)
  }
  
  private func presentPushReceived() {
    let context = MainTabBarContext()
    context.profileContext.user = User(name: "Vasil")
    context.profileContext.language = .ru
    try? router.navigate(to: RouteMap.profileSettingsPushScreen, with: context)
  }
  
}

extension UIApplication {
  
  var appDelegate: AppDelegate {
    return delegate as! AppDelegate
  }
}
