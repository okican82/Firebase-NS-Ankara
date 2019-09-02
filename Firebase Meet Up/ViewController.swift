//
//  ViewController.swift
//  Firebase Meet Up
//
//  Created by Enocta on 1.09.2019.
//  Copyright © 2019 Enocta. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn


class ViewController: UIViewController {

    @IBOutlet var userName_txt: UITextField!
    @IBOutlet var password_txt: UITextField!
    
    var spinnerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(Auth.auth().currentUser != nil)
        {
            NSLog("Bir user var","user var")
            
        }
        
        //let loginButton = FBSDKLoginButton()
        //loginButton.delegate = self
        
        initializeSpinner()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonClicked(_ sender: Any) {
        guard let email = userName_txt.text else {return}
        guard let password = password_txt.text else {return}
        
        startActivityIndicator()
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if(error == nil && user != nil)
            {
                self.stopActivityIndicator()
                self.gotoList()
            }
            else
            {
                self.stopActivityIndicator()
                NSLog("Error login user",error!.localizedDescription)
            }
        }
    }
    
    func gotoList()
    {
        let storyboard = UIStoryboard (name:"Main",bundle:nil)
        let LVC = storyboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        self.navigationController?.pushViewController(LVC, animated: true)
    }
    
    func startActivityIndicator(){
        self.view.addSubview(spinnerView)
    }
    
    func stopActivityIndicator(){
        let subviews = self.view.subviews
        
        for subview in subviews {
            if(subview.tag == 100)
            {
                subview.removeFromSuperview()
            }
        }
    }
    
    func initializeSpinner(){
        spinnerView = UIView(frame:CGRect(x:0,y:0,width:250,height:50))
        spinnerView.backgroundColor = UIColor.white
        spinnerView.layer.cornerRadius = 10
        
        let wait = UIActivityIndicatorView(frame:CGRect(x:0,y:0,width:50,height:50))
        wait.color = UIColor.black
        wait.hidesWhenStopped = false
        wait.startAnimating()
        
        let text = UILabel(frame:CGRect(x:50,y:0,width:200,height:50))
        text.text = "Lütfen Bekleyin"
        
        spinnerView.addSubview(wait)
        spinnerView.addSubview(text)
        
        spinnerView.center = self.view.center
        spinnerView.tag = 100
        
        
    }
    
}

