//
//  AppDelegate.swift
//  WifiAutoConnectTest
//
//  Created by LongMa on 2021/9/29.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = .yellow
        
        let navC = UINavigationController.init(rootViewController: ViewController.init())
        window?.rootViewController = navC
        window?.makeKeyAndVisible()
        return true
    }

   


}

