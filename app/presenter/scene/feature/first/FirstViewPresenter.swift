//
//  FirstPresenter.swift
//  app
//
//  Created by Guilherme Cherubini on 21/03/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import Foundation

protocol FirstViewPresenterDelegate: class {
    func didEnterName(_ userName: String)
}

class FirstViewPresenter {
    
    let view: FirstView
    let service: PersistenceService
    weak var delegate: FirstViewPresenterDelegate?
    
    init(service: PersistenceService, view: FirstView, delegate: FirstViewPresenterDelegate?) {
        self.service = service
        self.view = view
        self.delegate = delegate
    }
    
    func load() {
        view.setBtnText("Submit!!!")
        view.setTextFieldHint("Tell me your name")
    }
    
    func persist(userName: String?) {
        guard let userName = userName, !userName.isEmpty else {
            view.showError(with: "Fill field correctly!")
            return
        }
        
        service.persist(userName: userName)
        delegate?.didEnterName(userName)
    }
}
