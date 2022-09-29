//
//  LoginViewController.swift
//  WBooks
//
//  Created by ana.mancuso on 27/09/2022.
//

import UIKit

class LoginViewController: UIViewController {

    private lazy var loginView = LoginView()
    private let viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.singinButton.addTarget(self, action:#selector(singinButtonAction), for: .touchUpInside)
    }
    
    override func loadView() {
        view = loginView
    }

    //MARK: Action
    
    @objc func singinButtonAction() {
        let tabBar = TabBarController()
        UIApplication.shared.windows.first?.rootViewController = tabBar
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
}
