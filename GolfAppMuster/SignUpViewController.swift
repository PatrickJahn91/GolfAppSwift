//
//  SignUpViewController.swift
//  GolfAppMuster
//
//  Created by Patrick Jahn on 01.12.22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore


class SignUpViewController: UIViewController {

    
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var pwValidationTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signupBtnTapped(_ sender: Any) {
        signUp()
    }
    
    func signUp() {
        
        var validated = false
        
        // TextFields in Konstanten ablegen
        let email = emailTF.text!
        let password = passwordTF.text!
        let pwValidation = pwValidationTF.text!
        
        //MARK: 1. Validierung: Sind die Felder alle gefüllt?
        if !email.isEmpty && !password.isEmpty && !pwValidation.isEmpty {
            
            // 2. Validierung: Sind spezifische Bedingungen erfüllt?
            if !email.contains("@") {
                createAlert(withTitle: "Email", andMessage: "Bitte gib eine korrekte Email an.")
            } else if password.count < 6 {
                createAlert(withTitle: "Passwort", andMessage: "Das Passwort muss mind. 6 Zeichen beinhalten.")
            } else if password != pwValidation {
                createAlert(withTitle: "Passwort", andMessage: "Passwörter stimmen nicht überein.")
            } else {
                validated = true
            }
        } else {
            createAlert(withTitle: "Fehler", andMessage: "Bitte fülle alle Felder aus.")
        }
        
        //MARK: - User erstellen, wenn Validation erfolgreich
        if validated {
            
            // User erstellen
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if error != nil {
                    self.createAlert(withTitle: "Fehler", andMessage: "Es ist ein unbekannter Fehler aufgetreten.")
                } else {
                    
                    // Create Firestore
                    let db = Firestore.firestore()
                    db.collection("Users").addDocument(data: [
                        "email": email,
                        "uid": authResult?.user.uid as Any
                    ]) { error in
                        
                        if error != nil {
                            self.createAlert(withTitle: "Fehler", andMessage: "Es ist ein Fehler aufgetreten")
                        } else {
                            self.performSegue(withIdentifier: "signupSuccessful", sender: nil)
                        }
                    }
                }
                
            }
            
        }
        
        
        
    }
    
    func createAlert(withTitle: String, andMessage: String) {
        
        let alertController = UIAlertController(title: withTitle, message: andMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alertController, animated: true)
        
    }

}
