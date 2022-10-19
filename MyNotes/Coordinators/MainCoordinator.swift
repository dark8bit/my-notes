//
//  MainCoordinator.swift
//  MyNotes
//
//  Created by Владислав Клепиков on 22.09.2022.
//

import UIKit

protocol MainCoordinatorDelegate: AnyObject {
    
}

class MainCoordinator: Coordinator {
    private let navController: UINavigationController
    weak var delegate: MainCoordinatorDelegate?
    
    init(navController: UINavigationController, delegate: MainCoordinatorDelegate) {
        self.navController = navController
        self.delegate = delegate
    }
    
    func start() {
        let mainViewController = MainViewController()
        navController.setViewControllers([mainViewController], animated: true)
    }
}
