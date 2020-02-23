//
//  BreedBrowseView.swift
//  CatBreeds
//
//  Created by Herve Desrosiers on 2020-02-22.
//  Copyright © 2020 Josh Adams. All rights reserved.
//

import UIKit

class BreedBrowseView: UIView {
    @UsesAutoLayout // use extension and property wrapper
  // 0 This particular UIView subclass has one control, a UITableView
  //   internal is appropriate in cases like this where another class, BreedBrowseVC, needs access to the control
  internal var table: UITableView = {
    let table = UITableView()
    // 1 IB now supports named colors but not named fonts and named paddings...
    table.backgroundColor = Colors.blackish
    // 2 never forget this line else view won't appear
    table.translatesAutoresizingMaskIntoConstraints = false
    return table
  } ()

  required init(coder aDecoder: NSCoder) { // required by UIView subclass even if storyboard is not used
    fatalError("init(coder:) has not been implemented.")
  }

  // 3 init() function of a UIView subclass has two jobs: add controls it owns as subviews of itself and constrain these controls using Auto Layout
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = Colors.blackish
    // 4
    addSubview(table)
    // 5
//    table.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
//    table.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
//    table.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).isActive = true
//    table.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    table.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).activate()
    table.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    table.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
    table.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).activate()
  }

  // 6 This code could go in BreedBrowseVC, but bundling it here is tidier
  func setupTable(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
    table.dataSource = dataSource
    table.delegate = delegate
    table.register(BreedCell.self, forCellReuseIdentifier: "\(BreedCell.self)")
  }
}
