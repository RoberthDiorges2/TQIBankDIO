//
//  LoginCoordinator.swift
//  TQIBankDIO
//
//  Created by Roberth Diorges on 29/01/22.
//

import Foundation
import UIKit

class LoginCoordinator {
    
    var window: UIWindow
    var viewModel: LoginViewModel?
    var loginViewController: LoginViewController?
    var navigationController: UINavigationController?
    
    var homeCoordinator: HomeCoordinator?
    var homeView: HomeViewController?
    
    required init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
     
        viewModel = LoginViewModel()
        viewModel?.coordinatorDelegate = self
        loginViewController = LoginViewController(viewModel: viewModel!)
        
        navigationController = UINavigationController(rootViewController: loginViewController!)
        window.rootViewController = navigationController
    }
}

extension LoginCoordinator: LoginViewModelCoordinatorDelegate {
    func goToHome(_ viewModel: LoginViewModel, user: User) {
        guard let navigation = navigationController else { return }
        homeCoordinator = HomeCoordinator()
        homeCoordinator?.start(usingPresentation: .push(navigation: navigation))
    }
}
