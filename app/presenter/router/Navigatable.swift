//
//  Navigatable.swift
//  app
//
//  Created by Guilherme Cherubini on 17/04/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import Foundation

protocol NavigatableCoordinator {
    associatedtype Coordinator
    func navigate(to coordinator: Coordinator)
}

protocol NavigatableScene {
    associatedtype Scene
    func navigate(to scene: Scene)
}
