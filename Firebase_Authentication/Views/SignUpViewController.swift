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
    
    // Check the fields and validate if the data is correct. If incorrect, returns an error, otherwise returns nil.
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields"
        }
        
        // Check if password is secure
        let filteredPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(filteredPassword) == false {
            return "Please make sure password is at least 8 characters, and contains a special characer and number"
        }
        
        
        return nil
    }
    
    func showError( _ message: String) {
        errorLabel.text! = message
        errorLabel.alpha = 1
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        
        // Validate the fields
        let error = validateFields()
        
        if error != nil {
            
            // If error present, display message
            showError(error!)
        } else {
            // Create the user
        }
        // Create the user
        
        // Transition to the home screen
        
    }
    


}
