//
//  AppDelegate.swift
//  R.swiftModuleTest
//
//  Created by LongMa on 2022/1/10.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = .yellow
        window?.rootViewController = ViewController.init()
        window?.makeKeyAndVisible()
        
        return true
    }



}

