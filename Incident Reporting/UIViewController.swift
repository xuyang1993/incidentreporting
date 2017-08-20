//
//  UIViewController.swift
//  Incident Reporting
//
//  Created by XuYang on 19/8/17.
//  Copyright © 2017 XuYang. All rights reserved.
//

import Foundation

import UIKit



extension UIViewController {
    
    
    func showAlert(_ message: String) {
        
        let actionSheetController = UIAlertController(title: "Alert",
                                                      message: message,
                                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        actionSheetController.addAction(action)
        
        self.present(actionSheetController, animated: true, completion: nil)
        
    }
    
}
