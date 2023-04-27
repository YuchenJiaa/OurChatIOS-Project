//
//  RegisterViewController.swift
//  OurChat
//
//  Created by 贾贾 on 2023/4/26.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var registerRuleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerRuleLabel.isHidden = true
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.registerRuleLabel.isHidden = false
                    self.registerRuleLabel.text = e.localizedDescription
                    print(e.localizedDescription)
                }else {
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
    }
    
}
