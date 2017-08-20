//
//  SearchTableViewCell.swift
//  Incident Reporting
//
//  Created by XuYang on 19/8/17.
//  Copyright © 2017 XuYang. All rights reserved.
//

import Foundation

import UIKit


class SearchTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var label_date: UILabel!
    
    @IBOutlet weak var label_time: UILabel!
    
    
    @IBOutlet weak var label_machine: UILabel!
    
    @IBOutlet weak var label_id: UILabel!
    
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
    }
    
    var incident = Incident() {
        didSet {
            
            // Date
            label_date.text = incident.date!
            
            // Time
            label_time.text = incident.time!
            
            // Machine Name
            label_machine.text = incident.machine_name!
            
            // ID
            label_id.text = "ID: " + String(incident.id)
            
        }
    }
    
}
