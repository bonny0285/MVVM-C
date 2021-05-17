//
//  COneViewController.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 10/05/21.
//

import UIKit

class COneViewController: BaseViewController {

    //MARK: - Properties

    var viewModel = COneViewModel()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "C-1"
        tabBarController?.tabBarItem.title = "C"
    }
    
    //MARK: - Actions

    @IBAction func controllerC2WasPressed(_ sender: CustomButton) {
        viewModel.delegate?.moveToC2ViewController()
    }
    
    @IBAction func controllerC3WasPressed(_ sender: CustomButton) {
        viewModel.delegate?.moveTOC3ViewController()
    }
    
    @IBAction func controllerA1WasPressed(_ sender: CustomButton) {
        viewModel.delegate?.moveToA1ViewController()
    }
    
    @IBAction func controllerB1WasPressed(_ sender: CustomButton) {
        viewModel.delegate?.moveToB1ViewCOntroller()
    }
}
