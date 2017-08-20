//
//  SearchViewController.swift
//  Incident Reporting
//
//  Created by XuYang on 19/8/17.
//  Copyright © 2017 XuYang. All rights reserved.
//

import UIKit

import CoreData


class SearchViewController: UIViewController {

    
    @IBOutlet weak var tableview: UITableView!
    
    
    var Incidents: [NSManagedObject] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation Title
        self.navigationItem.title = "INCIDENT HISTORY"
        
        
        
        // Table View
        tableview.tableFooterView = UIView()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Incident")
        
        do {
            Incidents = try managedContext.fetch(fetchRequest)
            
            Incidents.reverse()
            
            self.tableview.reloadData()
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
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

}


extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Incidents.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        let index_incident = Incidents[indexPath.row]
        
        cell.incident = index_incident as! Incident
        
        return cell
    }
    
}

