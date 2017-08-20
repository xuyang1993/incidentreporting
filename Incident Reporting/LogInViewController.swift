//
//  LogInViewController.swift
//  Incident Reporting
//
//  Created by XuYang on 19/8/17.
//  Copyright © 2017 XuYang. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    
    @IBOutlet weak var textfield_username: UITextField!
    
    @IBOutlet weak var textfield_password: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Text Field
        
        textfield_username.setBottomLine(UIColor.gray)
        
        textfield_password.setBottomLine(UIColor.gray)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func Button_LogIn(_ sender: UIButton) {
        
        if !textfield_username.text!.checkLength() {
            
            self.showAlert("Username is at least 8 characters")
            
        } else if !textfield_password.text!.checkLength() {
            
            self.showAlert("Password is at leat 8 characters")
            
        } else {
            
            UserDefaults.standard.set(true, forKey: "user_isLoggedIn")
            
            
            let actionSheetController = UIAlertController(title: "Success",
                                                          message: "",
                                                          preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .cancel, handler: { (alert) in
                self.dismiss(animated: true, completion: nil)
            })
            
            actionSheetController.addAction(action)
            
            self.present(actionSheetController, animated: true, completion: nil)
        
            
        }
        
    }
    
    
    func checkLength(_ input: String) -> Bool {
        
        if input.characters.count < 8 {
            return false
        } else {
            return true
        }
        
    }
    
    
}



extension String {
    
    func checkLength() -> Bool {
        
        if self.characters.count < 8 {
            return false
        } else {
            return true
        }
        
    }
    
}







