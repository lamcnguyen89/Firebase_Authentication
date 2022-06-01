//
//  LoginViewController.swift
//  Firebase_Authentication
//
//  Created by Lam Nguyen on 5/31/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupElements()
    }
    
    func transitionToHome() {
        
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
    func setupElements() {
        
        // Set error label to be initially invisible
        errorLabel.alpha = 0
        
        // Style Elements
        
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
        
    }
    
    @IBAction func loginAction(_ sender: Any) {
        
        // TODO: Validate the text fields
        
        // Create cleaned versions of email and password
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Sign in the User
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
            
            if error != nil {
                
                //Can't sign in
                // When you're referencing things inside a closure, use the "self" keyword to reference things inside the class that the closure is a child of.
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            } else {
                self.transitionToHome()
            }
        }
        
    }
    


}
