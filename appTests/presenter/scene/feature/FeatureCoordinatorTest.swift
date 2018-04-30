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

class FeatureCoordinatorTest: QuickSpec {

    override func spec() {
        
        var navigationMock: NavigationControllerMock!
        var featureCoordinator: FeatureCoordinator!
        
        describe("FeatureCoordinatorTest") {
            
            beforeEach {
                navigationMock = NavigationControllerMock()
                featureCoordinator = FeatureCoordinator(navigationController: navigationMock)
            }
            
            context("When it starts") {
                it("Show the first scene") {
                    featureCoordinator.start()
                    expect(navigationMock.setViewControllersCall?.viewControllers[0] is FirstViewController) == true
                    expect(navigationMock.setViewControllersCall?.animated) == false
                }
            }
            
            context("When routes to first scene") {
                it("Make and show firt scene") {
                    featureCoordinator.showFirstScene()
                    expect(navigationMock.setViewControllersCall?.viewControllers[0] is FirstViewController) == true
                    expect(navigationMock.setViewControllersCall?.animated) == false
                }
            }
            
            context("When routes to second scene") {
                it("Make and show second scene") {
                    featureCoordinator.showSecondScene(userName: "God")
                    expect(navigationMock.pushViewControllerCall?.viewController is SecondViewController) == true
                    expect(navigationMock.pushViewControllerCall?.animated) == true
                }
            }
        }
    }
}
