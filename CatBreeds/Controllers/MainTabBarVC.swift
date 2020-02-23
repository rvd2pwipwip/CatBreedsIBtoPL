//
//  MainTabBarVC.swift
//  CatBreeds
//
//  Created by Herve Desrosiers on 2020-02-22.
//  Copyright © 2020 Josh Adams. All rights reserved.
//

//  https://racecondition.software/blog/programmatic-layout/

import UIKit

class MainTabBarVC: UITabBarController {
  // 0
  internal static let tabs = ["Browse", "Credits"]

  init() {
    super.init(nibName: nil, bundle: nil)
    // 1 creates the left-hand UIViewController, a BreedBrowseVC, and embeds it in a UINavigationController
    let breedBrowseNavC = UINavigationController(rootViewController: BreedBrowseVC())
    // 2 sets the name, “Browse”, and the icon, a sitting cat, of the BreedBrowseVC’s UITabBarItem
    breedBrowseNavC.tabBarItem = UITabBarItem(title: MainTabBarVC.tabs[0], image: UIImage(named: MainTabBarVC.tabs[0]), selectedImage: nil)
    // 3 creates the right-hand UIViewController, a CreditsVC. There is no drill-down from credits, so there is no UINavigationController
    let creditsVC = CreditsVC()
    // 4 sets the name, “Credits”, and the icon, a jumping cat, of the CreditsVC’s UITabBarItem
    creditsVC.tabBarItem = UITabBarItem(title: MainTabBarVC.tabs[1], image: UIImage(named: MainTabBarVC.tabs[1]), selectedImage: nil)
    // 5 tells the UITabBarController to manage the browse-and-credits UIViewControllers
    viewControllers = [breedBrowseNavC, creditsVC]
  }

  // 6 Swift’s initializer rules require inclusion of this initializer, but because you won’t be using a storyboard, the implementation need not be functional
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented.")
  }
}
