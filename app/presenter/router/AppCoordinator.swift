//
//  AppCoordinator.swift
//  app
//
//  Created by Guilherme Cherubini on 17/04/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import UIKit
import Foundation

class AppCoordinator: NavigatableCoordinator {
    
    enum Coordinator {
        case hello
    }
    
    private let window: UIWindow
    private let navigationController: UINavigationController
    private var featureCoordinator: FeatureCoordinator?
    
    init(window: UIWindow?, navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        self.window = window ?? UIWindow()
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    func start() {
        navigate(to: .hello)
    }
    
    func navigate(to coordinator: Coordinator) {
        switch coordinator {
        case .hello:
            startInitialRouter()
        }
    }
}

private extension AppCoordinator {
    func startInitialRouter() {
        featureCoordinator = FeatureCoordinator(navigationController: navigationController)
        featureCoordinator?.start()
    }
}
