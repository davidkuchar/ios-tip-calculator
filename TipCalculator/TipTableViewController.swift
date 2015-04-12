//
//  TipTableViewController.swift
//  TipCalculator
//
//  Created by David Kuchar on 4/11/15.
//  Copyright (c) 2015 David Kuchar. All rights reserved.
//

import UIKit

class TipTableViewController: UITableViewController {
    
    var tips: [Int] = DataManager.sharedInstance.tipsList
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.tips.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tipCell", forIndexPath: indexPath) as! UITableViewCell
        
        var tipValue = self.tips[indexPath.row]
        
        cell.textLabel?.text = String(tipValue)
        
        if DataManager.sharedInstance.isTipSelected(tipValue) {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var tipValue = self.tips[indexPath.row]
        
        println("You selected cell #\(tipValue)!")
        
        DataManager.sharedInstance.selectTip(tipValue)
        
        self.tableView.reloadData()
    }
}
