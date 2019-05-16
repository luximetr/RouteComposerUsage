//
//  ProfileSettingsScreen.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/12/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation
import RouteComposer

class ProfileSettingsVC: VC, ContextAccepting {
  
  typealias Context = MainTabBarContext
  
  var context: Context!
  var user: User!
  
  func setup(with context: Context) throws {
    self.context = context
    self.user = context.profileContext.user
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    label.text = user.name
    
    let logoutButton = UIButton()
    logoutButton.addTarget(self, action: #selector(didTapOnLogout), for: .touchUpInside)
    view.addSubview(logoutButton)
    logoutButton.frame = CGRect(x: 24, y: 400, width: 200, height: 100)
    logoutButton.setTitle("Logout", for: .normal)
    logoutButton.backgroundColor = .black
  }
  
  @objc
  private func didTapOnLogout() {
    try? router.navigate(to: RouteMap.guestProfileSettingsScreens, with: context)
  }
  
  override func goToNextScreen() {
    LanguageManager.shared.switchLanguage()
    dismiss(animated: true)
  }
}
