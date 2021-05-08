//
//  ViewController.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 05/05/21.
//

import UIKit

class AirportViewController: UIViewController {

    var viewModel = AirportViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "AIRPORT VIEW CONTROLLER"
    }

    @IBAction func italyWasPressed(_ sender: UIButton) {
        viewModel.delegate?.goToItaly()
    }
    
    @IBAction func ukWasPressed(_ sender: UIButton) {
        viewModel.delegate?.goToUK()
    }
}

