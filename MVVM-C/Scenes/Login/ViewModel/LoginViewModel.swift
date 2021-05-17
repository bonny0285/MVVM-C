//
//  LoginCoordinator.swift
//  MVVM-C
//
//  Created by Massimiliano on 08/05/21.
//

import UIKit

protocol LoginViewModelDelegate: AnyObject {
    func loginSuccessfully()
    func moveToRegistration()
    func moveToRecoveryPassword()
}

class LoginViewModel: BaseViewModel {
    weak var delegate: LoginViewModelDelegate?
}
