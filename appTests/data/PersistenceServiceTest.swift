//
//  PersistenceServiceTest.swift
//  appTests
//
//  Created by Guilherme Cherubini on 04/07/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import app

fileprivate let setUserNameMock = "set user name"
fileprivate let getUserNameMock = "get user name"

class PersistenceServiceTest: QuickSpec {
    
    override func spec() {
        
        var defaultsSpy: UserDefaultsSpy!
        var service: PersistenceService!

        describe("PersistenceServiceTest") {
            
            beforeEach {
                defaultsSpy = UserDefaultsSpy()
                service = PersistenceService(defaults: defaultsSpy)
            }
            
            context("When it init") {
                it("Setup defaults") {
                    expect(service.defaults) == defaultsSpy
                }
            }
            
            context("Persist user name") {
                beforeEach {
                    service.persist(userName: setUserNameMock)
                }
                
                it("Saves name in user defaults") {
                    expect(defaultsSpy.setName?.0 as? String) == setUserNameMock
                }
                
                it("Persist in user defaults correct key") {
                    expect(defaultsSpy.setName?.1) == "userName"
                }
            }
            
            context("Get user name") {
                var getName: String?
                
                beforeEach {
                    getName = service.getUserName()
                }
                
                it("Get user name string") {
                    expect(getName) == getUserNameMock
                }
                
                it("Get user name from correct key") {
                    expect(defaultsSpy.getNameKey) == "userName"
                }
            }
        }
    }
}

fileprivate class UserDefaultsSpy: UserDefaults {
    var setName: (Any?, String)?
    var getNameKey: String?
    
    override init?(suiteName suitename: String?) {
        super.init(suiteName: suitename)
    }
    
    override func set(_ value: Any?, forKey defaultName: String) {
        setName = (value, defaultName)
    }

    override func string(forKey defaultName: String) -> String? {
        getNameKey = defaultName
        return getUserNameMock
    }
}
