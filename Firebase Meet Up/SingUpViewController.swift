//
//  SingUpViewController.swift
//  Firebase Meet Up
//
//  Created by Enocta on 1.09.2019.
//  Copyright © 2019 Enocta. All rights reserved.
//

import UIKit
import Firebase

class SingUpViewController: UIViewController {

    @IBOutlet var userName_txt: UITextField!
    @IBOutlet var userPassword_txt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        guard let email = userName_txt.text else {return}
        guard let password = userPassword_txt.text else {return}
        
        
        Auth.auth().createUser(withEmail: email, password: password){ user,error in
            if(error == nil && user != nil)
            {
                NSLog("user created","user created")
            }
            else
            {
                NSLog("Error Creating user",error!.localizedDescription)
            }
            
        }

    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
