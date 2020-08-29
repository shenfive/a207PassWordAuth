//
//  ViewController.swift
//  a207PassWordAuth
//
//  Created by 申潤五 on 2020/8/29.
//  Copyright © 2020 申潤五. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var status: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().addIDTokenDidChangeListener { (auth, user) in
            if let user = user{
                self.signInUI()
            }else{
                self.signOutUI()
            }
        }
    }

    func signInUI(){
        print("己登入")
        if let user = Auth.auth().currentUser?.email{
            status.text = "歡迎" + user
        }
    }
    func signOutUI(){
        print("未登入")
        status.text = "未登入"
    }
    @IBAction func signIn(_ sender: Any) {
        if let email = account.text,let password = password.text{
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if let error = error{
                    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(okBtn)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func signOut(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch  {
            print(error.localizedDescription)
        }
    }
}

