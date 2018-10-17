//
//  FeatureSceneFactoryTest.swift
//  appTests
//
//  Created by Guilherme Cherubini on 18/04/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import app

class FeatureSceneFactoryTest: QuickSpec {
    
    override func spec() {
        describe("FeatureSceneFactoryTest") {
            context("When creating first scene") {
								let firstDelegateMock = FirstPresenterDelegateMock()
								let scene = FeatureSceneFactory.makeFirstScene(delegate: firstDelegateMock)
							
                it("Sets presenter on view controller") {
                    expect(scene.presenter).toNot(beNil())
                }
                
                it("Sets service on presenter") {
                    expect(scene.presenter.service).toNot(beNil())
                }
                
                it("Sets delegate on presenter") {
                    expect(scene.presenter.delegate).toNot(beNil())
                    expect(scene.presenter.delegate) === firstDelegateMock
                }
   
                it("Sets view on presenter") {
                    expect(scene.presenter.view).toNot(beNil())
                }
            }
            
            context("When creating second scene") {
								let userNameMock = "mockedName"
                let scene = FeatureSceneFactory.makeSecondScene(userName: userNameMock)
                
                it("Sets presenter on view controller") {
                    expect(scene.presenter).toNot(beNil())
                }
                
                it("Sets service on presenter") {
                    expect(scene.presenter.service).toNot(beNil())
                }
                
                it("Sets view on presenter") {
                    expect(scene.presenter.view).toNot(beNil())
                }
                
                it("Sets user name on presenter") {
                    expect(scene.presenter.nameFromParam).toNot(beNil())
                    expect(scene.presenter.nameFromParam) == userNameMock
                }
            }
        }
    }
}

fileprivate class FirstPresenterDelegateMock: FirstViewPresenterDelegate {
    func didEnterName(_ userName: String) {
        
    }
}
