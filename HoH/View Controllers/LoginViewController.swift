//
//  LoginViewController.swift
//  HoH
//
//  Created by Macintosh HD on 2020-03-24.
//  Copyright © 2020 Jolene. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblError: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        lblError.alpha = 0
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // Helper Functions
    func validateFields() -> String? {
        // Check all fields are filled in
         if txtEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            txtPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields"
        }
        
        // Check if password is valid
        let password = txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(password) == false {
            // Password is invalid
            return "Password should contain at least 8 characters with 1 special character and 1 number"
        }
        
        // Check if email is valid
        let email = txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isValidEmail(email) == false {
            return "Please enter a valid email address"
        }
        return nil
        
    }
    
    func showError(_ message:String){
        lblError.text = message
        lblError.alpha = 1
    }

    @IBAction func loginTapped(_ sender: Any) {
        // Validate Text Fields
        let error = validateFields()
        if error != nil {
            showError(error!)
        }
        else {
            // Log user in
            let email = txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Signing in the user
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                
                if error != nil {
                    // Couldn't sign in
                    self.lblError.text = error!.localizedDescription
                    self.lblError.alpha = 1
                }
                else {
                    
                    let dashboardViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.dashboardViewController) as? DashboardViewController
                    
                    self.view.window?.rootViewController = dashboardViewController
                    self.view.window?.makeKeyAndVisible()
                }
            }
            
        }
        
    }
}
