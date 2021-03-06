//
//  ThemeSettingsTableViewController.swift
//  TipCalculator
//
//  Created by David Kuchar on 4/10/15.
//  Copyright (c) 2015 David Kuchar. All rights reserved.
//

import UIKit

class ThemeSettingsTableViewController: UITableViewController {

    var themes: [String] = DataManager.sharedInstance.themeList
    
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
        return self.themes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("themeCell", forIndexPath: indexPath) as! UITableViewCell

        var themeName = self.themes[indexPath.row]
        
        cell.textLabel?.text = themeName
        
        if DataManager.sharedInstance.isThemeSelected(themeName) {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var themeName = self.themes[indexPath.row]
        
        println("You selected cell #\(themeName)!")

        DataManager.sharedInstance.selectTheme(themeName)
        
        self.tableView.reloadData()
    }
}
