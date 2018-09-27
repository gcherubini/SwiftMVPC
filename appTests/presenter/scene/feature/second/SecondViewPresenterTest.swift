//
//  SecondViewPresenter.swift
//  appTests
//
//  Created by Guilherme Cherubini on 21/03/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import app

class SecondViewPresenterTest: QuickSpec {
    
    override func spec() {
        
        var viewSpy: ViewSpy!
        var serviceMock: ServiceMock!
        var serviceNilMock: ServiceNilMock!
        var serviceEmptyMock: ServiceEmptyMock!
        var presenter: SecondViewPresenter!
        
        describe("Presenter") {
        
            beforeEach {
                viewSpy = ViewSpy()
                serviceMock = ServiceMock()
                serviceNilMock = ServiceNilMock()
                serviceEmptyMock = ServiceEmptyMock()
            }
            
            func setup(serviceMock: PersistenceService, nameFromParam: String? = nil) {
                presenter = SecondViewPresenter(service: serviceMock, view: viewSpy, nameFromParam: nameFromParam)
                presenter.load()
            }
            
            describe("Load user name from param") {
                context("When it has a proper value") {
                    it("Present a message with name") {
                        setup(serviceMock: serviceMock, nameFromParam: "God")
                        expect(viewSpy.nameFromParamMessage) == "God (from param)"
                    }
                }
                context("When it is empty") {
                    it("Show an error message") {
                        setup(serviceMock: serviceMock, nameFromParam: "")
                        expect(viewSpy.error) == "Error getting user name from param"
                    }
                }
                
                context("When it is nil") {
                    it("Show an error message") {
                        setup(serviceMock: serviceMock, nameFromParam: nil)
                        expect(viewSpy.error) == "Error getting user name from param"
                    }
                }
            }
            
            describe("Load user name from persistence") {
                context("When it has a proper value") {
                    it("Present a message with name") {
                        setup(serviceMock: serviceMock)
                        expect(viewSpy.nameFromPersistenceMessage) == "God (from persistence)"
                    }
                }
                context("When it is empty") {
                    it("Show an error message") {
                        setup(serviceMock: serviceEmptyMock)
                        expect(viewSpy.error) == "Error getting user name from persistence"
                    }
                }
                
                context("When it is nil") {
                    it("Show an error message") {
                        setup(serviceMock: serviceNilMock)
                        expect(viewSpy.error) == "Error getting user name from persistence"
                    }
                }
            }
        }
    }
}

fileprivate class ViewSpy: SecondView {
    var nameFromParamMessage: String?
    var nameFromPersistenceMessage: String?
    var error: String?
    
    func setNameFromParam(_ text: String) {
        nameFromParamMessage = text
    }
    
    func setNameFromPersistence(_ text: String) {
        nameFromPersistenceMessage = text
    }
    
    func showError(with message: String) {
        error = message
    }
}

fileprivate class ServiceMock: PersistenceService {
    override func getUserName() -> String? {
        return "God"
    }
}

fileprivate class ServiceNilMock: PersistenceService {
    override func getUserName() -> String? {
        return nil
    }
}

fileprivate class ServiceEmptyMock: PersistenceService {
    override func getUserName() -> String? {
        return ""
    }
}
