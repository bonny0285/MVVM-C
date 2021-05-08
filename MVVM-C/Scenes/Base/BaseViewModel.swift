//
//  BaseViewModel.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 05/05/21.
//

import Foundation

protocol BaseViewModelDelegate: AnyObject {
    func popViewController()
}

class BaseViewModel {
    weak var _delegate: BaseViewModelDelegate?
}
