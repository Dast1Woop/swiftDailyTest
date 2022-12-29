//
//  AppDelegate.swift
//  SceneTest
//
//  Created by LongMa on 2022/12/13.
//

import UIKit

/**方法调用顺序：
 启动app：
 application(_:didFinishLaunchingWithOptions:)
 scene(_:willConnectTo:options:)
 viewDidLoad()
 viewWillAppear(_:)
 sceneWillEnterForeground(_:)
 sceneDidBecomeActive(_:)
 退到后台：
 sceneWillResignActive(_:)
 sceneDidEnterBackground(_:)
 回到前台：
 sceneWillEnterForeground(_:)
 sceneDidBecomeActive(_:)
 */

/**All state transitions result in UIKit sending notifications to the appropriate delegate object:
 
 In iOS 13 and later — A UISceneDelegate object.

 In iOS 12 and earlier — The UIApplicationDelegate object.

 You can support both types of delegate objects, but UIKit always uses scene delegate objects when they’re available. UIKit notifies only the scene delegate associated with the specific scene that’s entering the foreground. For information about how to configure scene support, see Specifying the scenes your app supports.
 */

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        print(#function)
        
        return true
    }
    
    //内存警告时会被执行：Respond to other significant events（https://developer.apple.com/documentation/uikit/app_and_environment/managing_your_app_s_life_cycle）
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        print(#function)
    }
    

// 使用scene时，下面代理方法不会回调！
//    func applicationWillEnterForeground(_ application: UIApplication) {
//        print(#function)
//    }
//
//    func applicationDidEnterBackground(_ application: UIApplication) {
//        print(#function)
//    }
//
//    func applicationWillResignActive(_ application: UIApplication) {
//        print(#function)
//    }
//
//    func applicationDidBecomeActive(_ application: UIApplication) {
//        print(#function)
//    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        print(#function)
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        
        print(#function)
    }

  
}

