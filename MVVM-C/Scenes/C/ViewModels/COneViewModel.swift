//
//  COneViewModel.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 10/05/21.
//

import UIKit

protocol COneViewModelDelegate: AnyObject {
    func moveToC2ViewController()
    func moveTOC3ViewController()
    func moveToA1ViewController()
    func moveToB1ViewCOntroller()
}

class COneViewModel: BaseViewModel {
    weak var delegate: COneViewModelDelegate?
}
