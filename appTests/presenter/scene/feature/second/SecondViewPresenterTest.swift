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
		
		var sut: SecondViewPresenter!
		var viewSpy = ViewSpy()
	
		describe("SecondPresenter") {
			
			func setup(serviceMock: PersistenceService = ServiceMock(),
								 nameFromParam: String? = nil) {
					sut = SecondViewPresenter(
						service: serviceMock,
						view: viewSpy,
						nameFromParam: nameFromParam
					)
					sut.load()
			}
		
			describe("Load user name from param") {
					context("When it has a proper value") {
							it("Present a message with name") {
									setup(nameFromParam: "God")
									expect(viewSpy.nameFromParamMessage) == "God (from param)"
							}
					}
					context("When it is empty") {
							it("Show an error message") {
									setup(nameFromParam: "")
									expect(viewSpy.errorMessage) == "Error getting user name from param"
							}
					}
				
					context("When it is nil") {
							it("Show an error message") {
									setup(nameFromParam: nil)
									expect(viewSpy.errorMessage) == "Error getting user name from param"
							}
					}
			}
		
			describe("Load user name from persistence") {
					context("When it has a proper value") {
							it("Present a message with name") {
									setup()
									expect(viewSpy.nameFromPersistenceMessage) == "God (from persistence)"
							}
					}
					context("When it is empty") {
							it("Show an error message") {
									setup(serviceMock: ServiceEmptyMock())
									expect(viewSpy.errorMessage) == "Error getting user name from persistence"
							}
					}
				
					context("When it is nil") {
							it("Show an error message") {
									setup(serviceMock: ServiceNilMock())
									expect(viewSpy.errorMessage) == "Error getting user name from persistence"
							}
					}
			}
		}
	}
}

fileprivate class ViewSpy: SecondView {
    var nameFromParamMessage: String?
    var nameFromPersistenceMessage: String?
    var errorMessage: String?
    
    func setNameFromParam(_ text: String) {
        nameFromParamMessage = text
    }
    
    func setNameFromPersistence(_ text: String) {
        nameFromPersistenceMessage = text
    }
    
    func showError(with message: String) {
        errorMessage = message
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
