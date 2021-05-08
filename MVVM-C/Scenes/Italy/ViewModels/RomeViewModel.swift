//
//  RomeViewModel.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 05/05/21.
//

import Foundation

protocol RomeViewModelDelegate: BaseViewModelDelegate {
    func goToMilanFromRome()
    func goToNaplesFromRome()
    func goToLondonFromRome()
}

class RomeViewModel: BaseViewModel {
    weak var delegate: RomeViewModelDelegate?
}
