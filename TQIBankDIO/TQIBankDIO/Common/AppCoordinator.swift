//
//  AppCoordinator.swift
//  TQIBankDIO
//
//  Created by Roberth Diorges on 29/01/22.
//

import Foundation
import UIKit

class AppCoordinator {
    
    var window: UIWindow
    var loginCoordinator: LoginCoordinator?
    var viewModel: LoginViewModel?
    var loginViewController: LoginViewController?
    
    required init(window: UIWindow) {
        self.window = window
        self.window.makeKeyAndVisible()
    }
    
    func start() {
        loginCoordinator = LoginCoordinator(window: window)
        loginCoordinator?.start()
    }
}
