//
//  NavigationControllerMock.swift
//  appTests
//
//  Created by Guilherme Cherubini on 30/04/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import Foundation
import UIKit

class NavigationControllerMock: UINavigationController {
    var setViewControllersCall: (viewControllers: [UIViewController], animated: Bool)?
    var pushViewControllerCall: (viewController: UIViewController, animated: Bool)?
    
    override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        setViewControllersCall = (viewControllers, animated)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushViewControllerCall = (viewController, animated)
    }
}
