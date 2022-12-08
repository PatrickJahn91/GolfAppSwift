//
//  LoginViewController.swift
//  GolfAppMuster
//
//  Created by Patrick Jahn on 02.12.22.
//

import UIKit
import Firebase
import FirebaseAuth


class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("Kein User aktuell")
            return
        }
        
        if !uid.isEmpty {
            print("\(uid)")
            //performSegue(withIdentifier: "loginSuccessful", sender: nil)
        }
    }
    
    @IBAction func loginBtnTapped(_ sender: Any) {
        
        let email = emailTF.text!
        let password = passwordTF.text!
        
        if !email.isEmpty && !password.isEmpty {
            
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                
                if error != nil {
                    print("Etwas ist schiefgelaufen beim Login")
                } else {
                    self.performSegue(withIdentifier: "loginSuccessful", sender: nil)
                }
                
            }
            
        }
    }
    

    

}
