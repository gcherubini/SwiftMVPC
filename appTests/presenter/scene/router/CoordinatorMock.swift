//
//  CoordinatorMock.swift
//  appTests
//
//  Created by Guilherme Cherubini on 17/10/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import Foundation
@testable import app

class CoordinatorMock: Coordinator {
  
  var hasStarted = false
  
  func start() {
    hasStarted = true
  }
}
