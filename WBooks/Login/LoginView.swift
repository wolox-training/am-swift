//
//  LoginView.swift
//  WBooks
//
//  Created by ana.mancuso on 27/09/2022.
//

import UIKit

final class LoginView: NibView {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet var signinButton: UIButton! {
        didSet {
            signinButton.setTitle(NSLocalizedString("SIGN_IN_BUTTON", comment: ""), for: .normal)
            
        }
    }
    
}
