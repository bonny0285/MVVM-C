//
//  RecoveryPasswordViewModel.swift
//  MVVM-C
//
//  Created by Massimiliano on 08/05/21.
//

import UIKit

protocol RecoveryPasswordViewModelDelegate: AnyObject {
    func moveToLoginFromRecovery()
}

class RecoveryPasswordViewModel: BaseViewModel {
    weak var delegate: RecoveryPasswordViewModelDelegate?
}
