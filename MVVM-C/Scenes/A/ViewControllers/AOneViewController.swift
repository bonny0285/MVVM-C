//
//  AOneViewController.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 10/05/21.
//

import UIKit

class AOneViewController: BaseViewController {

    //MARK: - Properties

    var viewModel = AOneViewModel()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.navigationController?.title = "A-1"
        tabBarController?.tabBarItem.title = "A"
    }
    
    //MARK: - Actions

    @IBAction func controllerA2WasPressed(_ sender: CustomButton) {
        viewModel.delegate?.moveToA2ViewController()
    }
    
    @IBAction func controllerA3WasPressed(_ sender: CustomButton) {
        viewModel.delegate?.moveToA3ViewController()
    }
    
    @IBAction func controllerB1WasPressed(_ sender: CustomButton) {
        viewModel.delegate?.moveToB1ViewController()
    }
    
    @IBAction func controllerC1WasPressed(_ sender: CustomButton) {
        viewModel.delegate?.moveToC1ViewController()
    }
    
}
