//
//  LanguageManager.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/11/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import Foundation

enum Language {
  case en
  case ru
}

class LanguageManager {
  
  static let shared = LanguageManager()
  
  var currentLanguage: Language = .en
  
  func changeLanguage(_ language: Language) {
    currentLanguage = language
    NotificationCenter.default.post(name: .changeLanguage, object: nil)
  }
  
  func switchLanguage() {
    switch currentLanguage {
    case .en: changeLanguage(.ru)
    case .ru: changeLanguage(.en)
    }
  }
}

extension Notification.Name {
  static let changeLanguage = Notification.Name("changeLanguage")
}
