//
//  HelloCoordinator.swift
//  app
//
//  Created by Guilherme Cherubini on 17/04/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import UIKit

class FeatureCoordinator: NavigatableScene {
    enum Scene {
        case first
        case second(userName: String)
    }
    
    private let navigationController: UINavigationController
    private let sceneFactory: FeatureSceneFactory
    
    init(navigationController: UINavigationController = UINavigationController(), sceneFactory: FeatureSceneFactory = FeatureSceneFactory()) {
        self.navigationController = navigationController
        self.sceneFactory = sceneFactory
    }
    
    func start() {
        navigate(to: .first)
    }
    
    func navigate(to scene: Scene) {
        switch scene {
        case .first:
            showFirstScene()
        case .second(let userName):
            showSecondScene(with: userName)
        }
    }
}

private extension FeatureCoordinator {
    func showFirstScene() {
        let firstScene = sceneFactory.makeFirstScene(delegate: self)
        navigationController.viewControllers = [firstScene]
    }
    
    func showSecondScene(with userName: String) {
        let helloScene = sceneFactory.makeSecondScene(userName: userName)
        navigationController.pushViewController(helloScene, animated: true)
    }
}

extension FeatureCoordinator: FirstViewPresenterDelegate {
    func didEnterName(_ userName: String) {
        showSecondScene(with: userName)
    }
}
