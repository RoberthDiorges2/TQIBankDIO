//
//  HomeCoodinator.swift
//  TQIBankDIO
//
//  Created by Roberth Diorges on 29/01/22.
//

import Foundation
import TQICoordinator


class HomeCoordinator: Coordinator {
    
    var navigation: UINavigationController?
    var presentationType: PresentationType?
    
    var viewModel: HomeViewModel?
    var view: HomeViewController?
    
    init() {
        viewModel = HomeViewModel()
        view = HomeViewController(viewModel: viewModel!)
    }
    
    func stop() {
        navigation = nil
        presentationType = nil
        viewModel = nil
        view = nil
    }
}
