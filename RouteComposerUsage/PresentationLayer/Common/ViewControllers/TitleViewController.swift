//
//  TitleViewController.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/8/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import UIKit
import RouteComposer

class TitleViewController: InitViewController {
  
  let router = DefaultRouter()
  let label = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(label)
    label.frame = CGRect(x: 24, y: 100, width: UIScreen.main.bounds.width - 48, height: 100)
    label.numberOfLines = 0
    label.text = String(describing: type(of: self))
    
    let nextButton = UIButton()
    nextButton.addTarget(self, action: #selector(didTapOnNextButton), for: .touchUpInside)
    view.addSubview(nextButton)
    nextButton.frame = CGRect(x: 24, y: 200, width: 200, height: 100)
    nextButton.setTitle("Next", for: .normal)
    nextButton.backgroundColor = .black
  }
  
  @objc
  private func didTapOnNextButton() {
    goToNextScreen()
  }
  
  func goToNextScreen() {
    
  }
}
