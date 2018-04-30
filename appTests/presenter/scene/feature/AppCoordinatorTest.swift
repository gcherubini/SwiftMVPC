//
//  FeatureCoordinator.swift
//  appTests
//
//  Created by Guilherme Cherubini on 20/04/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import Foundation

import Foundation
import Quick
import Nimble
@testable import app

class AppCoordinatorTest: QuickSpec {

    override func spec() {
        
        var windowMock: UIWindow!
        var navigationMock: NavigationControllerMock!
        var appCoordinator: AppCoordinator!
        
        describe("AppCoordinatorTest") {
            
            beforeEach {
                windowMock = UIWindow()
                navigationMock = NavigationControllerMock()
                appCoordinator = AppCoordinator(window: windowMock, navigationController: navigationMock)
            }
            
            context("When it init") {
                it("Setup window configuration") {
                    expect(windowMock.rootViewController) == navigationMock
                    expect(windowMock.isKeyWindow) == true
                    expect(windowMock.isHidden) == false
                }
            }
            
            context("When it starts") {
                it("Start the feature coordinator") {
                    appCoordinator.start()
                    expect(navigationMock.setViewControllersCall?.viewControllers[0] is FirstViewController) == true
                    expect(navigationMock.setViewControllersCall?.animated) == false
                }
            }
        }
    }
}
