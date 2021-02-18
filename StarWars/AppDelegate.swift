//
//  AppDelegate.swift
//  StarWars
//
//  Created by Anastas Smekh on 12.02.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        startApp()
        return true
    }
    
    private func startApp() {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let mainModule = MainAssembly.assembly()
        let tabBar = TabBarAssembly.assembly()
        
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
        
    }

}

