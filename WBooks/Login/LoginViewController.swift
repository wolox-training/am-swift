//
//  LoginViewController.swift
//  WBooks
//
//  Created by ana.mancuso on 27/09/2022.
//

import UIKit

class LoginViewController: UIViewController {

    private lazy var loginView = LoginView()
    private let loginViewModel: LoginViewModel
    
    init(loginViewModel: LoginViewModel) {
        self.loginViewModel = loginViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.signinButton.addTarget(self, action:#selector(signinButtonAction), for: .touchUpInside)
        textFieldDelegate()
    }
    
    override func loadView() {
        view = loginView
    }
    
    func textFieldDelegate() {
        loginView.usernameTextField.delegate = self
        loginView.passwordTextField.delegate = self
    }
    
    //MARK: Action
    
    @objc func signinButtonAction() {
        let tabBar = TabBarController()
        let errorSubmit = String(localized: "ALERT_SUBMIT_ERROR")
        let errorAlert = UIAlertController(title: "¡ERROR!", message: errorSubmit, preferredStyle: .alert)
        if loginViewModel.verifyTexts() {
            UIApplication.shared.windows.first?.rootViewController = tabBar
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
        else {
            errorAlert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                debugPrint("The \"OK\" alert occured.")
            }))
            self.present(errorAlert, animated: true, completion: nil)
        }
    }
    
}
extension LoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let customTextField = textField as? LoginTextField else {
            return true
        }
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        switch textField {
        case loginView.usernameTextField:
            loginViewModel.username = text
        case loginView.passwordTextField:
            loginViewModel.password = text
        default:
            break
        }
        return true
    }
    
}
