//
//  ViewControllers.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/8/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import UIKit
import RouteComposer

typealias VC = TitleViewController

class TutorialVC: VC {
  override func goToNextScreen() {
    try? router.navigate(to: RouteMap.mainTabBarScreen, with: MainTabBarContext())
  }
}

class CheckStateVC: VC {
  override func goToNextScreen() {
    try? router.navigate(to: RouteMap.mainTabBarScreen, with: MainTabBarContext())
  }
}

class ConsultationHelpVC: VC {}

class PaymentConfirmVC: VC {}



class ConsultationPendingVC: VC {}

class TextChatVC: VC {}

class RateVC: VC {}

class DoctorInfoVC: VC {}


// MARK: - InitVCFactory

class InitVCFactory<VC: UIViewController, C>: Factory {
  
  typealias ViewController = VC
  
  typealias Context = C
  
  
  func build(with context: C) throws -> VC {
    return VC()
  }
  
}

protocol ContextContained {
  associatedtype Context
  var context: Context! { get set }
}

class ContextVCFactory<VC: UIViewController, C>: Factory where VC: ContextContained, VC.Context == C {
  
  typealias ViewController = VC
  
  typealias Context = C
  
  func build(with context: C) throws -> VC {
    var vc = VC()
    vc.context = context
    return vc
  }
}
