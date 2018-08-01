//
//  AppDelegate.swift
//  app
//
//  Created by Guilherme Cherubini on 20/03/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        appCoordinator = AppCoordinator()
        appCoordinator.start()
        
        return true
    }
}

