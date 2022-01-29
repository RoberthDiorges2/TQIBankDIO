//
//  HomeViewModel.swift
//  TQIBankDIO
//
//  Created by Roberth Diorges on 29/01/22.
//

import Foundation

protocol HomeViewModelViewDelegate: AnyObject {
    func viewFailure(_ viewModel: HomeViewModel, error: Error)
    func viewSuccess(_ viewModel: HomeViewModel)
}

protocol HomeViewModelCoordinatorDelegate: AnyObject {
    func homeViewModelGoToExtract(_ viewModel: HomeViewModel)
}

class HomeViewModel {
    
    var model: MenuOptions
    let service: HomeService
    
    weak var viewDelegate: HomeViewModelViewDelegate?
    weak var coordinatorDelegate: HomeViewModelCoordinatorDelegate?
    
    public init(model: MenuOptions = .init(), service: HomeService = .init()) {
        self.model = model
        self.service = service
    }
    
    func getMenuOptions() {
        service.getMenus { result in
            DispatchQueue.main.async {
                switch result {
                case let .success(model):
                    self.model = model
                    self.viewDelegate?.viewSuccess(self)
                case let .failure(error):
                    self.viewDelegate?.viewFailure(self, error: error)
                }
            }
        }
    }
    
    func goToExtract() {
        coordinatorDelegate?.homeViewModelGoToExtract(self)
    }
}
