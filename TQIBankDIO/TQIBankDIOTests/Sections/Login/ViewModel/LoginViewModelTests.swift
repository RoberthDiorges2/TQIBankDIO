//
//  LoginViewModelTests.swift
//  TQIBankTests
//
//  Created by Cristino Divino on 29/01/22.
//

import XCTest
import VFNetwork
@testable import TQIBankDIO

class LoginViewModelTests: XCTestCase {
    
    var viewModel: LoginViewModel!
    var mock: JSONMockOrchestrator!
    
    var goToHome = false
    var showLoading = true
    
    var postAuthenticateSuccess: ((_ response: User) -> Void)?
    var postAuthenticateFailure: ((_ error: Error) -> Void)?
    
    override func setUp() {
        super.setUp()
        viewModel = LoginViewModel()
        mock = JSONMockOrchestrator()
        let provider = RequestProvider<LoginAPI>()
        provider.executor.orchestrator = mock
        viewModel.service.provider = provider
        viewModel.viewDelegate = self
        viewModel.coordinatorDelegate = self
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel = nil
        mock = nil
    }
    
    
    func testPostAuthenticateSuccess() {
        let expectation = self.expectation(description: "Test Post Authenticate Success")
        let user = "tqi@mail.com"
        let password = "tqi123"
        
        mock.register(fileNamed: "login_response_success")
        
        
        postAuthenticateSuccess = { response in
            XCTAssertNotNil(response)
            XCTAssertTrue(self.goToHome)
            XCTAssertFalse(self.showLoading)
            expectation.fulfill()
        }

        viewModel.postAuthenticate(userName: user, password: password)
        
        waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    
    
    func testPostAuthenticateFailure() {
        let expectation = self.expectation(description: "Test Post Authenticate Failure")
        let user = "acelera@mail.com"
        let password = "123456"
        
        mock.register(fileNamed: "login_response_failure", statusCode: 500)
        
        postAuthenticateFailure = { error in
            XCTAssertNotNil(error)
            expectation.fulfill()
        }

        viewModel.postAuthenticate(userName: user, password: password)
        
        waitForExpectations(timeout: 10.0, handler: nil)
    }
}

extension LoginViewModelTests: LoginViewModelCoordinatorDelegate {
    func goToHome(_ viewModel: LoginViewModel, user: User) {
        goToHome = true
        postAuthenticateSuccess?(user)
    }
}

extension LoginViewModelTests: LoginViewModelViewDelegate {
    func showLoading(_ viewModel: LoginViewModel, isLoanding: Bool) {
        showLoading = false
    }
    
    func showError(_ viewModel: LoginViewModel, error: Error) {
        postAuthenticateFailure?(error)
    }
}
