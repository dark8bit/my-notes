//
//  AppDelegate.swift
//  MyNotes
//
//  Created by Владислав Клепиков on 22.09.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var app: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navController = UINavigationController()
        let appCoordinator = AppCoordinator(navController: navController, window: window)
        app = appCoordinator
      
        appCoordinator.start()
        return true
    }
}

