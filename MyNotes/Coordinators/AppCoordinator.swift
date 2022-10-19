//
//  AppCoordinator.swift
//  Coordinator
//
//  Created by Владислав Клепиков on 21.09.2022.
//

import UIKit

final class AppCoordinator: Coordinator {
    // MARK: - Properties
    private let navController: UINavigationController
    private let window: UIWindow
    private var childCoordinators: [Coordinator] = []
    
    // MARK: - Initializer
    init(navController: UINavigationController, window: UIWindow) {
        self.navController = navController
        self.window = window
    }
    
    func start() {
        window.rootViewController = navController
        window.makeKeyAndVisible()
        
        showNotelyViewController()
    }
    
    // MARK: - Navigation
    private func showNotelyViewController() {
        let startViewController = StartViewController()
        startViewController.delegate = self
        navController.setViewControllers([startViewController], animated: true)
        childCoordinators.removeAll { $0 is MainCoordinator }
    }
    
    private func showMain() {
        let mainCoordinator = MainCoordinator(navController: navController, delegate: self)
        childCoordinators.append(mainCoordinator)
        mainCoordinator.start()
    }
}

// MARK: - StartViewControllerDelegate
extension AppCoordinator: StartViewControllerDelegate {
    func showMainViewController() {
        print("Lets start")
        showMain()
    }
}

extension AppCoordinator: MainCoordinatorDelegate {

}
