//
//  LoginViewController.swift
//  Firebase_Authentication
//
//  Created by Lam Nguyen on 5/31/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       setupElements()
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
    }
    


}
