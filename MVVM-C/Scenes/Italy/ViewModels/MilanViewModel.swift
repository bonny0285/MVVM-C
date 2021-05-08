//
//  MilanViewModel.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 05/05/21.
//

import Foundation

protocol MilanViewModelDelegate: BaseViewModelDelegate {
    func goToNaplesFromMilan()
    func goToUKFromMilan()
}

class MilanViewModel: BaseViewModel {
    
    weak var delegate: MilanViewModelDelegate?
}
