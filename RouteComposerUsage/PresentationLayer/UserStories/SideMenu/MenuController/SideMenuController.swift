//
//  SideMenuController.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/14/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import UIKit
import RouteComposer
import LGSideMenuController

public class SideMenuController: LGSideMenuController, UIGestureRecognizerDelegate, RouteComposer.ContainerViewController, MenuItemsControllerDelegate {
  
  // MARK: - Life cycle
  
  override init(rootView: UIView?) {
    super.init(rootView: rootView)
    initConfigure()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initConfigure()
  }
  
  required override init(rootViewController: UIViewController?) {
    super.init(rootViewController: rootViewController)
    initConfigure()
  }
  
  override init(rootView: UIView?, leftView: UIView?, rightView: UIView?) {
    super.init(rootView: rootView, leftView: leftView, rightView: rightView)
    initConfigure()
  }
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    initConfigure()
  }
  
  // MARK: - Init configure
  
  private func initConfigure() {
    panGesture.delegate = self
  }
  
  // MARK: - UIGestureRecognizerDelegate
  
  public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    if let rootNavigationController = (rootViewController as? ContainerViewController) {
      let needActivate = rootNavigationController.viewControllers.count <= 1
      return needActivate
    } else {
      return true
    }
  }
  
  public var containedViewControllers: [UIViewController] = []
  
  public var visibleViewControllers: [UIViewController] = []
  
  public var canBeDismissed: Bool = true
  
  public func makeVisible(_ viewController: UIViewController, animated: Bool) {
    rootViewController = viewController
    if animated {
      hideLeftViewAnimated()
    } else {
      hideLeftView()
    }
  }
  
  public func replace(containedViewControllers: [UIViewController], animated: Bool, completion: @escaping () -> Void) {
    self.containedViewControllers = containedViewControllers
    completion()
  }
  
  // MARK: - MenuItemsControllerDelegate
  
  public func didSelectItem(at index: Int) {
    guard index >= 0 && index < containedViewControllers.count else { return }
    let selectedVC = containedViewControllers[index]
    makeVisible(selectedVC, animated: true)
  }
}

private protocol ContainerViewController {
  var viewControllers: [UIViewController] { get }
}

extension UINavigationController: ContainerViewController {}
