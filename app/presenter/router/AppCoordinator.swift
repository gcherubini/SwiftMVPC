//
//  AppCoordinator.swift
//  app
//
//  Created by Guilherme Cherubini on 17/04/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import UIKit
import Foundation

class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    private let navigationController: UINavigationController
    var starterCoordinator: Coordinator?
    
    init(window: UIWindow = UIWindow(),
         navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
				setupWindow()
				setupStarterCoordinator()
    }
	
	func setupWindow() {
		self.window.rootViewController = navigationController
		self.window.makeKeyAndVisible()
	}
	
	func setupStarterCoordinator() {
		starterCoordinator = FeatureCoordinator(navigationController: navigationController)
	}
	
	func start() {
		starterCoordinator?.start()
	}
}
