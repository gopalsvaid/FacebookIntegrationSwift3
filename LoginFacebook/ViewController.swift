//
//  ViewController.swift
//  LoginFacebook
//
//  Created by Gopal Vaid on 03/02/17.
//  Copyright © 2017 Gopal Vaid. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Facebook Button Actions
    
    @IBAction func actionOnBtnLoginFB(sender: AnyObject){
        facebookLogin(fromViewController: self)
    }
    
    
    func facebookLogin(fromViewController:UIViewController)  {
        let loginManager = LoginManager()
        loginManager.loginBehavior = LoginBehavior.native;
        
        loginManager.logIn([.publicProfile, .email], viewController: fromViewController) { (loginResult) in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in \(grantedPermissions) \(declinedPermissions) \(accessToken)")
            }
        }
    }
    
    func loginManagerDidComplete(_ result: LoginResult) {
        switch result {
        case .cancelled:
            print("Login Cancelled User cancelled login.")
        case .failed(let error):
           print("Login failed with error \(error)")
        case .success(let grantedPermissions, _, _):
           print("Login succeeded with granted permissions: \(grantedPermissions)")
        }
    }
    
    @IBAction func logOut() {
        let loginManager = LoginManager()
        loginManager.logOut()
       
    }
}

