//
//  ViewController.swift
//  WBooks
//
//  Created by ana.mancuso on 19/09/2022.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Action
    @IBAction func singinButton(_ sender: UIButton) {
        print("Boton ingreso pulsado")
    }
}

