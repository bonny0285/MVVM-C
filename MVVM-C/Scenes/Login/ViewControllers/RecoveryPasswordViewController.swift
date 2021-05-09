//
//  RecoveryPasswordViewController.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 08/05/21.
//

import UIKit

class RecoveryPasswordViewController: BaseViewController {

    //MARK: - Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordHintLabel: UILabel!
    
    
    //MARK: - Properties
    var viewModel = RecoveryPasswordViewModel()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Recovery Password"
        passwordHintLabel.isHidden = true
    }
    

    //MARK: - Methods
    
    //MARK: - Actions
    
    @IBAction func recoveryButtonWasPressed(_ sender: CustomButton) {
    }
    
    @IBAction func cancelButtonWasPressed(_ sender: CustomButton) {
        viewModel.delegate?.moveToLoginFromRecovery()
    }
    
}
