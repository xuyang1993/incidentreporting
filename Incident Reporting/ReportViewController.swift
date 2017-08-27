//
//  ReportViewController.swift
//  Incident Reporting
//
//  Created by XuYang on 19/8/17.
//  Copyright © 2017 XuYang. All rights reserved.
//

import Foundation

import UIKit

import CoreData



class ReportViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var textfield_faultymachine: UITextField!
    
    @IBOutlet weak var textfield_impactedlocation: UITextField!
    
    @IBOutlet weak var textfield_description: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Navigation Title
        self.navigationItem.title = "NEW INCIDENT"
        
        
        
        // Text Field
        
        textfield_faultymachine.delegate = self
        
        textfield_faultymachine.setBottomLine(UIColor.gray)
        
        
        
        textfield_impactedlocation.delegate = self
        
        textfield_impactedlocation.setBottomLine(UIColor.gray)
        
        
        
        textfield_description.delegate = self
        
        textfield_description.setBottomLine(UIColor.gray)
        
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

    
    @IBAction func Button_Submit(_ sender: UIButton) {
        
        // Date
        let date = Date()
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd/MM/yyyy"
        
        let date_string = formatter.string(from: date)
        
        
        // Time
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        
        let minutes = calendar.component(.minute, from: date)
        
        let seconds = calendar.component(.second, from: date)
        
        let time_string = "\(hour):\(minutes):\(seconds)"
        
        
        // Millionsecondes
        let id = Date().millisecondsSince1970
        
        
        let machinename = textfield_faultymachine.text
        
        let location = textfield_impactedlocation.text
        
        let description = textfield_description.text
        
        if machinename == "" {
            
            self.showAlert("Please enter name of faulty machine")
            
        } else if location == "" {
            
            self.showAlert("Please enter name of impacted location")
            
        } else if description == "" {
            
            self.showAlert("Please enter short description of incident")
            
        } else {
            
            save(id, date: date_string, time: time_string, machineName: machinename!, description: description!, location: location!)
        }
        
    }
    
    func save(_ id: Int, date: String, time: String, machineName: String, description: String, location: String) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Incident", in: managedContext)!
        
        let incident = NSManagedObject(entity: entity, insertInto: managedContext)
        
        // Save ID
        incident.setValue(id, forKeyPath: "id")
        // Save Date
        incident.setValue(date, forKeyPath: "date")
        // Save Time
        incident.setValue(time, forKeyPath: "time")
        // Save Machine Name
        incident.setValue(machineName, forKeyPath: "machine_name")
        // Save Description
        incident.setValue(date, forKeyPath: "detail")
        
        
        do {
            
            try managedContext.save()
            
            self.navigationController?.popViewController(animated: true)
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
}


extension Date {
    
    var millisecondsSince1970:Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
    
}



