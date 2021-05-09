//
//  RegistrationViewController.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 08/05/21.
//

import UIKit

class RegistrationViewController: BaseViewController {

    //MARK: - Outlests
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var createAccountButton: CustomButton!
    
    //MARK: - Properties
    
    var viewModel = RegistrationViewModel()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Registration"
        createAccountButton.isEnabled = false
    }
    

    //MARK: - Methods
    
    //MARK: - Actions

    @IBAction func createAccountWasPressed(_ sender: CustomButton) {
        viewModel.delegate?.registrationSuccessfully()
    }
    
    @IBAction func cancelWasPressed(_ sender: CustomButton) {
        viewModel.delegate?.moveToLoginFromRegistration()
    }
    
}
