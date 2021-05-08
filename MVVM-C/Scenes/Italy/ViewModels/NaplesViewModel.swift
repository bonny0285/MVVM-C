//
//  NaplesViewModel.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 05/05/21.
//

import Foundation

protocol NaplesViewModelDelegate: BaseViewModelDelegate {
    func goToRomeFromNaples()
    func goToUKFromNaples()
}

class NaplesViewModel: BaseViewModel {
    weak var delegate: NaplesViewModelDelegate?
}
