//
//  ProfileScreen.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/12/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation
import RouteComposer

class ProfileVC: VC, ContextAccepting, ContextContained {
  
  typealias Context = MainTabBarContext

  var context: Context!
  var user: User!

  func setup(with context: Context) throws {
    self.context = context
    self.user = context.profileContext.user
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let logoutButton = UIButton()
    logoutButton.addTarget(self, action: #selector(didTapOnLogoutToAuthButton), for: .touchUpInside)
    view.addSubview(logoutButton)
    logoutButton.frame = CGRect(x: 24, y: 400, width: 200, height: 100)
    logoutButton.setTitle("Logout (to auth)", for: .normal)
    logoutButton.backgroundColor = .black
    
    let toGuestButton = UIButton()
    toGuestButton.addTarget(self, action: #selector(didTapOnLogoutToGuestProfile), for: .touchUpInside)
    view.addSubview(toGuestButton)
    toGuestButton.frame = CGRect(x: 24, y: 600, width: 200, height: 100)
    toGuestButton.setTitle("Logout (to guest)", for: .normal)
    toGuestButton.backgroundColor = .black
  }
  
  override func goToNextScreen() {
    try? router.navigate(to: RouteMap.profileEditingScreen, with: context)
  }
  
  @objc
  private func didTapOnLogoutToAuthButton() {
    try? router.navigate(to: AuthorizationRouteMap.afterDeAuthScreen, with: AuthPhoneContext())
  }
  
  @objc
  private func didTapOnLogoutToGuestProfile() {
    try? router.navigate(to: RouteMap.guestProfileScreen, with: context)
  }
}
