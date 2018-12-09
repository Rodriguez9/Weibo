//
//  AppDelegate.swift
//  weibo
//
//  Created by YZH on 2018/12/9.
//  Copyright © 2018年 YZH. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        //
//        let Homeroot = HomeViewController()
//        let Discoverroot = DiscoverViewController()
//        let Messageroot = MessageViewController()
//        let Mainroot = MainViewController()
//
//        let Home = UINavigationController(rootViewController: Homeroot)
//        let Discover = UINavigationController(rootViewController: Discoverroot)
//        let Message = UINavigationController(rootViewController: Messageroot)
//        let Main = UINavigationController(rootViewController: Mainroot)
//
//        let tabbar = UITabBarController()
//        tabbar.addChildViewController(Home)
//        tabbar.addChildViewController(Discover)
//        tabbar.addChildViewController(Message)
//        tabbar.addChildViewController(Main)
        let tabbar = TabBarViewController()
        
        self.window?.rootViewController = tabbar
        self.window?.makeKeyAndVisible()
        return true
    }
}

