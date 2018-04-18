//
//  ViewControllerExtensions.swift
//  app
//
//  Created by Guilherme Cherubini on 18/04/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showError(with message: String) {
        let alert = UIAlertController(title: "An error occurred!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: { _ in
            alert.dismiss(animated: true, completion: nil)
        }))
        navigationController?.present(alert, animated: true, completion: nil)
    }
}
