//
//  NaplesViewController.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 05/05/21.
//

import UIKit

class NaplesViewController: BaseViewController {

    //MARK: - Properties
    var viewModel: NaplesViewModel?
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "NAPLES"
    }
    

    @IBAction func romeWasPressed(_ sender: UIButton) {
        viewModel?.delegate?.goToRomeFromNaples()
    }
    
    @IBAction func ukWasPressed(_ sender: UIButton) {
        viewModel?.delegate?.goToUKFromNaples()
    }
    
}
