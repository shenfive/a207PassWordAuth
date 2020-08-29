//
//  Page2ViewController.swift
//  a207PassWordAuth
//
//  Created by 申潤五 on 2020/8/29.
//  Copyright © 2020 申潤五. All rights reserved.
//

import UIKit
import Firebase

class Page2ViewController: UIViewController {

    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    @IBAction func signUp(_ sender: Any) {
        
        if let email = account.text
            ,let password = password.text{
            Auth.auth().createUser(withEmail: email,
                                   password: password)
            { (result, error) in
                if let error = error{
                    print(error.localizedDescription)
                    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    let okBtn = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(okBtn)
                    self.present(alert, animated: true, completion: nil)
                }else{
                    let alert = UIAlertController(title: "歡迎", message: result?.user.email, preferredStyle: .alert)
                    let okBtn = UIAlertAction(title: "OK", style: .default) { (action) in
                        self.navigationController?.popViewController(animated: true)
                    }
                    alert.addAction(okBtn)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    

}
