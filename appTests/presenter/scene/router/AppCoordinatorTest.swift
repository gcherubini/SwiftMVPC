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
			
        let windowSpy = UIWindowSpy()
        let navigationMock = NavigationControllerMock()
        let sut = AppCoordinator(window: windowSpy, navigationController: navigationMock)
        
				describe("AppCoordinator") {
          context("When it initializes") {
            it("Setup window configuration") {
              expect(windowSpy.rootViewController) == navigationMock
              expect(windowSpy.makesKeyAndVisible) == true
            }
						
						it("Setup starter coordinator") {
							expect(sut.starterCoordinator is FeatureCoordinator) == true
						}
          }
          
          context("When it starts") {
              it("Start the starter coordinator") {
								let coordinatorSpy = CoordinatorMock()
                sut.starterCoordinator = coordinatorSpy
                sut.start()
                expect(coordinatorSpy.hasStarted) == true
              }
          }
        }
    }
}

