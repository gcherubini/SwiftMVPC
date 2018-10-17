//
//  UIWindowSpy.swift
//  appTests
//
//  Created by Guilherme Cherubini on 27/09/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import UIKit
import Foundation

class UIWindowSpy: UIWindow {
  var makesKeyAndVisible = false
  
  open override func makeKeyAndVisible(){
    makesKeyAndVisible = true
  }
}
