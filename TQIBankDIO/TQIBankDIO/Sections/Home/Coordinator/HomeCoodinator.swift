//
//  HomeCoodinator.swift
//  TQIBankDIO
//
//  Created by Roberth Diorges on 29/01/22.
//

import Foundation
import TQICoordinator
import TQIExtractDIO

class HomeCoordinator: Coordinator {
    
    var navigation: UINavigationController?
    var presentationType: PresentationType?
    
    var viewModel: HomeViewModel?
    var view: HomeViewController?
    
    var extractListCoordinator: ExtractListCoordinator?
    
    init() {
        viewModel = HomeViewModel()
        viewModel?.coordinatorDelegate = self
        view = HomeViewController(viewModel: viewModel!)
    }
    
    func stop() {
        navigation = nil
        presentationType = nil
        viewModel = nil
        view = nil
        extractListCoordinator = nil
    }
}

extension HomeCoordinator: HomeViewModelCoordinatorDelegate {
    func homeViewModelGoToExtract(_ viewModel: HomeViewModel) {
        guard let navigation = navigation else { return }
        extractListCoordinator = ExtractListCoordinator()
        extractListCoordinator?.start(usingPresentation: .push(navigation: navigation))
    }
}
