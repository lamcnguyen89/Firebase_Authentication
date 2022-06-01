//
//  SignUpViewController.swift
//  Firebase_Authentication
//
//  Created by Lam Nguyen on 5/31/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

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
    
    func transitionToHome() {
        
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
    // Style UI elements on the View
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
            
            // Create cleaned versions without whitespace of data
            let firstNameCleaned = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastNameCleaned = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let emailCleaned = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let passwordCleaned = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: emailCleaned, password: passwordCleaned) {(result, err) in
                
                // Check for Errors
                if  err != nil {
                    // There was an error creating the user
                    self.showError("Error creating user")
                } else {
                    
                    // User was created successfully now store first name and last name
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstName": firstNameCleaned, "lastName": lastNameCleaned, "uid": result!.user.uid ]) { (error) in
                        
                        if error != nil {
                            // Show Error Message
                            self.showError("User data couldn't be saved on the database")
                        }
                        
                    }
                    
                    // Transition to the home screen
                    self.transitionToHome()
                    
                }
                                
            }
            
        }

        
    }
    
        
    
    


}
