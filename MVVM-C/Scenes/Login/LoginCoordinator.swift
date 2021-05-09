//
//  LoginCoordinator.swift
//  MVVM-C
//
//  Created by Massimiliano on 08/05/21.
//

import UIKit

class LoginCoordinator: Coordinator {

    let rootNavigationController: UINavigationController!
    
    lazy var loginViewModel: LoginViewModel = {
        let viewModel = LoginViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    lazy var registrationViewModel: RegistrationViewModel = {
        let viewModel = RegistrationViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    lazy var recoveryViewModel: RecoveryPasswordViewModel = {
        let viewModel = RecoveryPasswordViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    private(set) var storyboard = UIStoryboard(name: "Login", bundle: Bundle.main)
    
    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }
    
    override func start(allowsReturnToPreviousCoordinator: Bool) {
        let loginViewController: LoginVIewController = storyboard.instantiateViewController(identifier: "LoginVIewController")
        loginViewController.viewModel = loginViewModel
        
        if allowsReturnToPreviousCoordinator {
            rootNavigationController.pushViewController(loginViewController, animated: true)
        } else {
            rootNavigationController.setViewControllers([loginViewController], animated: true)
        }
    }
    
    override func finish() {
        print("LOGIN COORDINATOR FINISHED")
    }
}


extension LoginCoordinator: LoginViewModelDelegate {
    func loginSuccessfully() {
        
    }
    
    func moveToRegistration() {
        let registrationViewController: RegistrationViewController = storyboard.instantiateViewController(identifier: "RegistrationViewController")
        registrationViewController.viewModel = registrationViewModel
        rootNavigationController.pushViewController(registrationViewController, animated: true)
    }
    
    func moveToRecoveryPassword() {
        let recoveryViewController: RecoveryPasswordViewController = storyboard.instantiateViewController(identifier: "RecoveryPasswordViewController")
        recoveryViewController.viewModel = recoveryViewModel
        rootNavigationController.pushViewController(recoveryViewController, animated: true)
    }
    
}

extension LoginCoordinator: RegistrationViewModelDelegate {
    func registrationSuccessfully() {
        
    }
    
    func moveToLoginFromRegistration() {
        let loginViewController: LoginVIewController = storyboard.instantiateViewController(identifier: "LoginVIewController")
        loginViewController.viewModel = loginViewModel
        rootNavigationController.pushViewController(loginViewController, animated: true)
    }
    
  
}

extension LoginCoordinator: RecoveryPasswordViewModelDelegate {
    
    func moveToLoginFromRecovery() {
        let loginViewController: LoginVIewController = storyboard.instantiateViewController(identifier: "LoginVIewController")
        loginViewController.viewModel = loginViewModel
    }
    

}
