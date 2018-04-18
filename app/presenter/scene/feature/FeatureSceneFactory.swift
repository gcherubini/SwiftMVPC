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
    
    func makeFirstScene(delegate: FirstViewPresenterDelegate?) -> FirstViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        let service = PersistenceService()
        let presenter = FirstViewPresenter(service: service, view: viewController, delegate: delegate)
        viewController.presenter = presenter
        return viewController
    }
    
    func makeSecondScene(userName: String) -> SecondViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        let service = PersistenceService()
        let presenter = SecondViewPresenter(service: service, view: viewController, nameFromParam: userName)
        viewController.presenter = presenter
        return viewController
    }
}
