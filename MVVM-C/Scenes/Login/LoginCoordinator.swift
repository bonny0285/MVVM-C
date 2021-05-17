//
//  LoginCoordinator.swift
//  MVVM-C
//
//  Created by Massimiliano on 08/05/21.
//

import UIKit

class LoginCoordinator: Coordinator {

    //MARK: - Properties

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
    
    //MARK: - Lifecycle

    init(rootNavigationController: UINavigationController) {
        self.rootNavigationController = rootNavigationController
    }
    
    //MARK: - Methods

    override func start(allowsReturnToPreviousCoordinator: Bool) {
        let loginViewController: LoginVIewController = storyboard.instantiateViewController(identifier: "LoginVIewController")
        //loginViewController.viewModel = loginViewModel
        loginViewController.viewModel.delegate = self
        
        if allowsReturnToPreviousCoordinator {
            rootNavigationController.pushViewController(loginViewController, animated: true)
        } else {
            rootNavigationController.setViewControllers([loginViewController], animated: true)
        }
    }
    
    override func finish() {}
    
    private func presentLoginViewController() {
        let loginViewController: LoginVIewController = storyboard.instantiateViewController(identifier: "LoginVIewController")
        loginViewController.navigationItem.setHidesBackButton(true, animated: true)
        loginViewController.viewModel = loginViewModel
        rootNavigationController.pushViewController(loginViewController, animated: true)
    }
    
    private func presentRegistrationViewController() {
        let registrationViewController: RegistrationViewController = storyboard.instantiateViewController(identifier: "RegistrationViewController")
        registrationViewController.navigationItem.setHidesBackButton(true, animated: true)
        registrationViewController.viewModel = registrationViewModel
        rootNavigationController.pushViewController(registrationViewController, animated: true)
    }
    
    private func presentRecoveryPasswordViewController() {
        let recoveryViewController: RecoveryPasswordViewController = storyboard.instantiateViewController(identifier: "RecoveryPasswordViewController")
        recoveryViewController.navigationItem.setHidesBackButton(true, animated: true)
        recoveryViewController.viewModel = recoveryViewModel
        rootNavigationController.pushViewController(recoveryViewController, animated: true)
    }
}


extension LoginCoordinator: LoginViewModelDelegate {
    func loginSuccessfully() {
        let tabCoordinator = TabBarCoordinator(rootNavigationController: rootNavigationController)
        tabCoordinator.start(allowsReturnToPreviousCoordinator: false)
    }
    
    func moveToRegistration() {
        presentRegistrationViewController()
    }
    
    func moveToRecoveryPassword() {
        presentRecoveryPasswordViewController()
    }
    
}

extension LoginCoordinator: RegistrationViewModelDelegate {
    func registrationSuccessfully() {
        rootNavigationController.popToRootViewController(animated: true)
    }
    
    func moveToLoginFromRegistration() {
        presentLoginViewController()
    }
}

extension LoginCoordinator: RecoveryPasswordViewModelDelegate {
    func moveToLoginFromRecovery() {
       presentLoginViewController()
    }
}
