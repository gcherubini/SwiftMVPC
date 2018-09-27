//
//  FirstPresenter.swift
//  app
//
//  Created by Guilherme Cherubini on 21/03/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import Foundation

class SecondViewPresenter {
    
    let view: SecondView
    let service: PersistenceService
    var nameFromParam: String?
    
    init(service: PersistenceService, view: SecondView, nameFromParam: String?) {
        self.service = service
        self.view = view
        self.nameFromParam = nameFromParam
    }
    
    func load() {
        presentNameFromParam()
        presentNameFromPersistence()
    }
    
    func presentNameFromParam() {
        guard let nameFromParam = nameFromParam, !nameFromParam.isEmpty else {
            view.showError(with: "Error getting user name from param")
            return
        }
        
        let message = "\(nameFromParam) (from param)"
        view.setNameFromParam(message)
    }
    
    func presentNameFromPersistence() {
        guard let nameFromPersistence = service.getUserName(), !nameFromPersistence.isEmpty else {
            view.showError(with: "Error getting user name from persistence")
            return
        }
        
        let message = "\(nameFromPersistence) (from persistence)"
        view.setNameFromPersistence(message)
    }
}
