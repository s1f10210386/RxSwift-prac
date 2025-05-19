//
//  AppDelegate.swift
//  RxSwiftPrac
//
//  Created by 金澤帆高 on 2025/05/08.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let viewController = RootViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        runProtocolPractice()
        return true
    }

}

