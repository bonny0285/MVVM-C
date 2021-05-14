//
//  LoginVIewController.swift
//  MVVM-C
//
//  Created by Bonafede Massimiliano on 08/05/21.
//

import UIKit

class LoginVIewController: BaseViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - Properties
    
    var viewModel = LoginViewModel()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: - Methods
    
    //MARK: - Actions
    
    @IBAction func loginWasPressed(_ sender: CustomButton) {
        viewModel.delegate?.loginSuccessfully()
    }
    
    @IBAction func registrationWasPressed(_ sender: CustomButton) {
        viewModel.delegate?.moveToRegistration()
    }
    
    @IBAction func recoveryWasPressed(_ sender: CustomButton) {
        viewModel.delegate?.moveToRecoveryPassword()
    }
    
}
