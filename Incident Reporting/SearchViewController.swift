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

    // Table View
    @IBOutlet weak var tableview: UITableView!
    
    // Search Bar
    @IBOutlet weak var searchbar: UISearchBar!
    
    
    // Data List
    var Incidents: [NSManagedObject] = []
    
    // Filter List
    var filterData: [NSManagedObject] = []
    
    
    // Search
    var isSearching = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Navigation Title
        self.navigationItem.title = "INCIDENT HISTORY"
        
        
        // Table View
        tableview.tableFooterView = UIView()
        
        loadTableViewData()
        
        
        // Search Bar
        searchbar.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadTableViewData() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Incident")
        
        do {
            Incidents = try managedContext.fetch(fetchRequest)
            
            // Show data from the latest one
            Incidents.reverse()
            
            self.tableview.reloadData()
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
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


extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearching {
            
            return filterData.count
        } else {
            
            return Incidents.count
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        // Show data
        if isSearching {
            
            let index_incident = filterData[indexPath.row]
            
            cell.incident = (index_incident as? Incident)!
            
        } else {
            
            let index_incident = Incidents[indexPath.row]
            
            cell.incident = index_incident as! Incident
            
        }
        
        return cell
    }
    
}


extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            
            isSearching = false
            
            view.endEditing(true)
            
            tableview.reloadData()
            
        } else {
            
            isSearching = true
            
            // Filter data based on input keywords
            filterData = Incidents.filter({ ($0 as! Incident).machine_name!.contains(searchBar.text!) })
            
            tableview.reloadData()
        }
        
    }
    
}

