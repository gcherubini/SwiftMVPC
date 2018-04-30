//
//  AppCoordinator.swift
//  app
//
//  Created by Guilherme Cherubini on 17/04/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import UIKit
import Foundation

class AppCoordinator {
    
    private let window: UIWindow
    private let navigationController: UINavigationController
    var featureCoordinator: FeatureCoordinator?
    
    init(window: UIWindow?, navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        self.window = window ?? UIWindow()
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    func start() {
        startFeatureCoordinator()
    }
}

private extension AppCoordinator {
    func startFeatureCoordinator() {
        featureCoordinator = FeatureCoordinator(navigationController: navigationController)
        featureCoordinator?.start()
    }
}
