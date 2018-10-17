//
//  FirstViewPresenter.swift
//  appTests
//
//  Created by Guilherme Cherubini on 21/03/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import app

class FirstViewPresenterTest: QuickSpec {
    
    override func spec() {
        
        let viewSpy = ViewSpy()
        let serviceSpy = ServiceSpy()
        let delegateSpy = DelegateSpy()
        let presenter = FirstViewPresenter(service: serviceSpy, view: viewSpy, delegate: delegateSpy)
        
        describe("FirstPresenterPresenter") {
            describe("On Load") {
                beforeEach {
                    presenter.load()
                }
                
                it("Set text field hint") {
                    expect(viewSpy.textFieldHint) == "Tell me your name"
                }
                
                it("Set button text") {
                    expect(viewSpy.buttonText) == "Submit!!!"
                }
            }
            
            describe("On Persist") {
                context("With a proper user name") {
                    
                    beforeEach {
                        presenter.persist(userName: "mockedName")
                    }
                    
                    it("Persist it") {
                        expect(serviceSpy.persistedUserName) == "mockedName"
                    }
                    
                    it("Pass it to delegate") {
                        expect(delegateSpy.enteredName) == "mockedName"
                    }
                }
                
                context("With a nil user name") {
                    it("Show error with custom message") {
                        presenter.persist(userName: nil)
                        expect(viewSpy.errorMessage) == "Fill field correctly!"
                    }
                }
                
                context("With an empty user name") {
                    it("Show error with custom message") {
                        presenter.persist(userName: "")
                        expect(viewSpy.errorMessage) == "Fill field correctly!"
                    }
                }
            }
        }
    }
}

fileprivate class ViewSpy: FirstView {
    var textFieldHint: String?
    var buttonText: String?
    var errorMessage: String?
    
    func setTextFieldHint(_ hint: String) {
        textFieldHint = hint
    }
    
    func setButtonText(_ text: String) {
        buttonText = text
    }
    
    func showError(with message: String) {
        errorMessage = message
    }
}

fileprivate class ServiceSpy: PersistenceService {
    var persistedUserName: String?
    
    override func persist(userName: String) {
        persistedUserName = userName
    }
}

fileprivate class DelegateSpy: FirstViewPresenterDelegate {
    var enteredName: String?
    
    func didEnterName(_ userName: String) {
        enteredName = userName
    }
}
