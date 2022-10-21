//
//  LoginView.swift
//  WBooks
//
//  Created by ana.mancuso on 27/09/2022.
//

import UIKit

final class LoginView: NibView {
    
    @IBOutlet weak var usernameTextField: UITextField! {
        didSet {
            usernameTextField.textColor = .gray
        }
    }
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.textColor = .gray
        }
    }
    @IBOutlet weak var iconImage: UIImageView! {
        didSet {
            iconImage.image = .icon
        }
    }
    @IBOutlet weak var backgroundImage: UIImageView! {
        didSet {
            backgroundImage.image = .backgroundImage
        }
    }
    @IBOutlet var signinButton: UIButton! {
        didSet {
            signinButton.setTitleColor(.summerSky, for: .normal)
            signinButton.backgroundColor = .white
            signinButton.titleLabel?.font = .boldSystemFont(ofSize: 16.0)
            signinButton.setTitle(NSLocalizedString("SIGN_IN_BUTTON", comment: ""), for: .normal)
            signinButton.layer.cornerRadius = 27
        }
    }
    
}
