//
//  ViewController.swift
//  app
//
//  Created by Guilherme Cherubini on 20/03/18.
//  Copyright © 2018 Guilherme Cherubini. All rights reserved.
//

import UIKit


protocol SecondView: class {
    func setNameFromParam(_ text: String)
    func setNameFromPersistence(_ text: String)
    func showError(with message: String)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var nameFromParamLabel: UILabel!
    @IBOutlet weak var nameFromPersistenceLabel: UILabel!
    
    var presenter: SecondViewPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.load()
    }
}

extension SecondViewController: SecondView {
    func setNameFromParam(_ text: String) {
        nameFromParamLabel.text =  text
        nameFromParamLabel.isHidden = false
    }
    
    func setNameFromPersistence(_ text: String) {
        nameFromPersistenceLabel.text =  text
        nameFromPersistenceLabel.isHidden = false
    }
}
