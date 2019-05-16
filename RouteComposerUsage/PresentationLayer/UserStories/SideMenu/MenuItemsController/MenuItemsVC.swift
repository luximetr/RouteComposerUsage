//
//  MenuItemsVC.swift
//  RouteComposerUsage
//
//  Created by branderstudio on 5/15/19.
//  Copyright © 2019 branderstudio. All rights reserved.
//

import UIKit
import SnapKit

class MenuItemsVC: InitViewController, UITableViewDataSource, UITableViewDelegate, MenuItemsController {
  
  private let tableView = UITableView()
  private var dataSource: [String] = []
  
  weak var delegate: MenuItemsControllerDelegate?
  
  // MARK: - Setup
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(tableView)
    tableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: itemCellId)
    tableView.delegate = self
    tableView.dataSource = self
    localize()
  }
  
  private func setTitles(_ titles: [String]) {
    dataSource = titles
    tableView.reloadData()
  }
  
  override func setup() {
    super.setup()
    NotificationCenter.default.addObserver(self, selector: #selector(localize), name: .changeLanguage, object: nil)
  }
  
  // MARK: - Localize
  
  @objc
  private func localize() {
    switch LanguageManager.shared.currentLanguage {
    case .en:
      setTitles([TabBarItemTitles.En.dashboard, TabBarItemTitles.En.profile, TabBarItemTitles.En.history])
    case .ru:
      setTitles([TabBarItemTitles.Ru.dashboard, TabBarItemTitles.Ru.profile, TabBarItemTitles.Ru.history])
    }
  }
  
  // MARK: - UITableViewDataSource
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  private let itemCellId = "itemCellId"
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: itemCellId, for: indexPath)
    cell.textLabel?.text = dataSource[indexPath.row]
    return cell
  }
  
  // MARK: - UITableViewDelegate
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    delegate?.didSelectItem(at: indexPath.row)
  }
}
