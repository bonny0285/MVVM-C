//
//  AirportViewModel.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 05/05/21.
//

import UIKit

protocol AirportViewModelDelegate: AnyObject {
    func goToItaly()
    func goToUK()
}

class AirportViewModel {
    
    weak var delegate: AirportViewModelDelegate?
    
}
