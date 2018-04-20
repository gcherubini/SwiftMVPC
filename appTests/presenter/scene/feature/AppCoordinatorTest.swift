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
        var featureCoordinator: FeatureCoordinator!
        
        describe("AppCoordinatorTest") {
            
            beforeEach {
                windowMock = UIWindow()
                navigationMock = NavigationControllerMock()
                featureCoordinator = AppCoordinator(window: windowMock, navigationController: navigationMock)
            }
            
            context("When it starts") {
                it("Start the feature coordinator") {
                   
                }
            }
        }
    }
}
