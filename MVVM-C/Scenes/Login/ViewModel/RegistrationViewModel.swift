//
//  RegistrationViewModel.swift
//  MVVM-C
//
//  Created by Massimiliano on 08/05/21.
//

import UIKit

protocol RegistrationViewModelDelegate: AnyObject {
    func registrationSuccessfully()
    func moveToLoginFromRegistration()
}

class RegistrationViewModel: BaseViewModel {

    weak var delegate: RegistrationViewModelDelegate?
}
