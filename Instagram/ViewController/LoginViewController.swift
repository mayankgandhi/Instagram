//
//  LoginViewController.swift
//  Instagram
//
//  Created by Mayank Gandhi on 16/08/18.
//  Copyright © 2018 Mayank Gandhi. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SignIn(_ sender: Any)
    {
        PFUser.logInWithUsername(inBackground: usernameField.text! , password: passwordField.text!)
        { (user: PFUser? ,error: Error?) in
            if user != nil
            {
                print("you have successfully signed in")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else
            {
                print(error?.localizedDescription ?? nil)
            }
        }
    }
    
    
    @IBAction func SignUp(_ sender: Any)
    {
        let newUser = PFUser()
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        
        newUser.signUpInBackground
            { (success: Bool,error: Error?) in
                if success
                {
                    print("you have successfully signed up")
                }
                else
                {
                    print(error?.localizedDescription ?? nil)
                }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
