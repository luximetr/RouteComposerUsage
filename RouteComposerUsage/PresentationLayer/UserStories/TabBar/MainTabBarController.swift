//
//  MainTabBarController.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/11/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
  
  override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
    super.setViewControllers(viewControllers, animated: animated)
    localize()
  }
  
  override init(nibName nibNameOrNil: String? = nil, bundle nibBundleOrNil: Bundle? = nil) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    initConfigure()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initConfigure()
  }
  
  deinit {
    print("Tab bar deinit")
  }
  
  func initConfigure() {
    NotificationCenter.default.addObserver(self, selector: #selector(localize), name: .changeLanguage, object: nil)
  }
  
  @objc
  private func localize() {
    switch LanguageManager.shared.currentLanguage {
    case .en:
      viewControllers?[0].tabBarItem.title = TabBarItemTitles.En.dashboard
      viewControllers?[1].tabBarItem.title = TabBarItemTitles.En.profile
      viewControllers?[2].tabBarItem.title = TabBarItemTitles.En.history
    case .ru:
      viewControllers?[0].tabBarItem.title = TabBarItemTitles.Ru.dashboard
      viewControllers?[1].tabBarItem.title = TabBarItemTitles.Ru.profile
      viewControllers?[2].tabBarItem.title = TabBarItemTitles.Ru.history
    }
  }
}

class TabBarItemTitles {
  struct Ru {
    static let dashboard = "Dashboard"
    static let profile = "Profile"
    static let history = "History"
  }
  struct En {
    static let dashboard = "Дашборд"
    static let profile = "Профиль"
    static let history = "История"
  }
}
