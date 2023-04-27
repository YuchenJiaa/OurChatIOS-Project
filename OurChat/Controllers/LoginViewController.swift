//
//  LoginViewController.swift
//  OurChat
//
//  Created by 贾贾 on 2023/4/26.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var loginRuleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginRuleLabel.isHidden = true
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let e = error {
                self.loginRuleLabel.isHidden = false
                self.loginRuleLabel.text = e.localizedDescription
                print(e.localizedDescription)
            }else {
                self.performSegue(withIdentifier: K.loginSegue, sender: self)
            }
         
        }
        }
    }


}
