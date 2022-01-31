//
//  LoginViewController.swift
//  TQIBankDIO
//
//  Created by Roberth Diorges on 29/01/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    var viewModel: LoginViewModel!
    
    init(viewModel: LoginViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingView.isHidden = true
        viewModel.viewDelegate = self
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        postAuthenticate()
    }
    
    func postAuthenticate() {

        guard let userName = userTextField.text, !userName.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else { return }
        isLoading(true)
        viewModel.postAuthenticate(userName: userName, password: password)
    }
    
    func isLoading(_ loading: Bool) {
        loadingView.isHidden = !loading
        loading ? loadingView.startAnimating() : loadingView.stopAnimating()
    }
}

extension LoginViewController: LoginViewModelViewDelegate {
    func showLoading(_ viewModel: LoginViewModel, isLoanding: Bool) {
        self.isLoading(isLoanding)
    }
    
    func showError(_ viewModel: LoginViewModel, error: Error) {
        debugPrint(error)
    }
}
