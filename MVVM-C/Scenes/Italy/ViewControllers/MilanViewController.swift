//
//  MilanViewController.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 05/05/21.
//

import UIKit

class MilanViewController: BaseViewController {

    //MARK: - Properties

    var viewModel: MilanViewModel?
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "MILAN"
    }
    
    //MARK: - Actions

    @IBAction func naplesWasPressed(_ sender: UIButton) {
        viewModel?.delegate?.goToNaplesFromMilan()
    }
    
    @IBAction func ukWasPressed(_ sender: UIButton) {
        viewModel?.delegate?.goToUKFromMilan()
    }
    
}
