//
//  HelloSceneFactory.swift
//  app
//
//  Created by Guilherme Cherubini on 17/04/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import Foundation
import UIKit

struct FeatureSceneFactory {
    static func makeFirstScene(delegate: FirstViewPresenterDelegate?) -> FirstViewController {
        let viewController = FirstViewController()
        let service = PersistenceService()
        let presenter = FirstViewPresenter(service: service, view: viewController, delegate: delegate)
        viewController.presenter = presenter
        return viewController
    }
    
    static func makeSecondScene(userName: String?) -> SecondViewController {
        let viewController = SecondViewController()
        let service = PersistenceService()
        let presenter = SecondViewPresenter(service: service, view: viewController, nameFromParam: userName)
        viewController.presenter = presenter
        return viewController
    }
}
