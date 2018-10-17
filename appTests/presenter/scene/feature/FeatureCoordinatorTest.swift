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
        var sut: FeatureCoordinator!
        
        describe("FeatureCoordinatorTest") {
            
            beforeEach {
                navigationMock = NavigationControllerMock()
                sut = FeatureCoordinator(navigationController: navigationMock)
            }
            
            context("When it starts") {
                it("Push the first scene") {
									sut.start()
									expect(navigationMock.setViewController?[0] is FirstViewController) == true
                }
            }
            
            context("When user name is entered") {
                it("Push the second scene") {
                    sut.didEnterName("mockedName")
										expect(navigationMock.pushedViewController?.viewController is SecondViewController) == true
										expect(navigationMock.pushedViewController?.animated) == true
                }
            }
        }
    }
}
