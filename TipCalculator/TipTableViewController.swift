//
//  TipTableViewController.swift
//  TipCalculator
//
//  Created by David Kuchar on 4/11/15.
//  Copyright (c) 2015 David Kuchar. All rights reserved.
//

import UIKit

class TipTableViewController: UITableViewController {
    
    var tips: [String] = DataManager.sharedInstance.tipsList
    
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
        
        var tipName = self.tips[indexPath.row]
        
        cell.textLabel?.text = String(tipName)
        
        if DataManager.sharedInstance.isTipSelected(tipName) {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var tipName = self.tips[indexPath.row]
        
        println("You selected cell #\(tipName)!")
        
        DataManager.sharedInstance.selectTip(tipName)
        
        self.tableView.reloadData()
    }
}
