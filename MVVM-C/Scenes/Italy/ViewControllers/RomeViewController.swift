//
//  RomeViewController.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 05/05/21.
//

import UIKit

class RomeViewController: BaseViewController {

    var viewModel: RomeViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ROME"
    }
    

    @IBAction func milanWasPressed(_ sender: UIButton) {
        viewModel?.delegate?.goToMilanFromRome()
    }
    
    @IBAction func naplesWasPressed(_ sender: UIButton) {
        viewModel?.delegate?.goToNaplesFromRome()
    }
    
    @IBAction func londonWasPressed(_ sender: UIButton) {
        viewModel?.delegate?.goToLondonFromRome()
    }
    
}
