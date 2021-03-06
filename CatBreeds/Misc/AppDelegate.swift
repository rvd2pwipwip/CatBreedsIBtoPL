//
//  AppDelegate.swift
//  CatBreeds
//
//  Created by Joshua Adams on 2/12/18.
//  Copyright © 2018 Josh Adams. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    Colors.changeDefaults()
    
    window = UIWindow(frame: UIScreen.main.bounds)
    let mainTabBarVC = MainTabBarVC()
    window?.rootViewController = mainTabBarVC // same as IB Is Initial View Controller
    window?.makeKeyAndVisible()
    
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {}

  func applicationDidEnterBackground(_ application: UIApplication) {}

  func applicationWillEnterForeground(_ application: UIApplication) {}

  func applicationDidBecomeActive(_ application: UIApplication) {}

  func applicationWillTerminate(_ application: UIApplication) {}
}
