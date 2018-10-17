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
		var setViewController: [UIViewController]?
    var pushedViewController: (viewController: UIViewController, animated: Bool)?
	
		override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
				setViewController = viewControllers
			}
	
		override func pushViewController(_ viewController: UIViewController, animated: Bool) {
				pushedViewController = (viewController, animated)
		}
}
