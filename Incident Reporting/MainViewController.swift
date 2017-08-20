//
//  MainViewController.swift
//  Incident Reporting
//
//  Created by XuYang on 19/8/17.
//  Copyright © 2017 XuYang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Navigation Title
        self.navigationItem.title = "INCIDENT REPORTING"
        
        
        
        // Navigation Right Button
         self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "logout",
                                                                  style: .plain,
                                                                  target: self,
                                                                  action: #selector(Button_LogOut))
        
        if !UserDefaults.standard.bool(forKey: "user_isLoggedIn") {
            
            popLogInViewController()
        }
        
        
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

    
    func Button_LogOut() {
        
        UserDefaults.standard.set(false, forKey: "user_isLoggedIn")
        
        popLogInViewController()
        
    }
    
    func popLogInViewController() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let des = storyboard.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
        des.modalTransitionStyle = .crossDissolve
        des.modalPresentationStyle = .custom
        self.present(des, animated: true, completion: nil)
        
    }
    
    @IBAction func Button_Submit(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "incident_report_segue", sender: nil)
    }
    
    
    @IBAction func Button_Histoyr(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "incident_search_segue", sender: nil)
    }
    
    
}
