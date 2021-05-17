//
//  AOneViewModel.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 10/05/21.
//

import UIKit

protocol AOneViewModelDelegate: AnyObject {
    func moveToA2ViewController()
    func moveToA3ViewController()
    func moveToB1ViewController()
    func moveToC1ViewController()
}

class AOneViewModel: BaseViewModel {
    weak var delegate: AOneViewModelDelegate? {
        willSet {
            print("Delegate on willSet is: \(String(describing: delegate))")
        }
        didSet {
            print("Delegate on didSet is: \(String(describing: delegate))")
        }
    }
}
