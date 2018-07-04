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
        
        var viewSpy: ViewSpy!
        var serviceSpy: ServiceSpy!
        var delegateSpy: DelegateSpy!
        var presenter: FirstViewPresenter!
        
        describe("Presenter") {
        
            beforeEach {
                viewSpy = ViewSpy()
                serviceSpy = ServiceSpy()
                delegateSpy = DelegateSpy()
                presenter = FirstViewPresenter(service: serviceSpy, view: viewSpy, delegate: delegateSpy)
            }
            
            describe("Load") {
                
                beforeEach {
                    presenter.load()
                }
                
                it("Text field hint") {
                    expect(viewSpy.textFieldHint) == "Tell me your name"
                }
                
                it("Button text") {
                    expect(viewSpy.buttonText) == "Submit!!!"
                }
            }
            
            describe("Persist") {
                context("Passing an appropriate user name") {
                    
                    beforeEach {
                        presenter.persist(userName: "God")
                    }
                    
                    it("Persist it") {
                        expect(serviceSpy.persistedUserName) == "God"
                    }
                    
                    it("Pass it to delegate") {
                        expect(delegateSpy.enteredName) == "God"
                    }
                }
                
                context("Passing a nil user name") {
                    it("Show a specific error") {
                        presenter.persist(userName: nil)
                        expect(viewSpy.error) == "Fill field correctly!"
                    }
                }
                
                context("Passing an empty user name") {
                    it("Show a specific error") {
                        presenter.persist(userName: "")
                        expect(viewSpy.error) == "Fill field correctly!"
                    }
                }
            }
        }
    }
}

fileprivate class ViewSpy: FirstView {
    var textFieldHint: String?
    var buttonText: String?
    var error: String?
    
    func setTextFieldHint(_ hint: String) {
        textFieldHint = hint
    }
    
    func setBtnText(_ text: String) {
        buttonText = text
    }
    
    func showError(with message: String) {
        error = message
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
