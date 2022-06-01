//
//  SignUpViewController.swift
//  Firebase_Authentication
//
//  Created by Lam Nguyen on 5/31/22.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupElements()
    }
    
    func setupElements() {
        
        // Set Error Label to be invisible initially
        errorLabel.alpha = 0
        
        // Style Text Fields
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        
        // Style Button
        Utilities.styleFilledButton(signUpButton)
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        
    }
    


}
