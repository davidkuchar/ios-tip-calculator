//
//  SettingsTableViewController.swift
//  TipCalculator
//
//  Created by David Kuchar on 4/10/15.
//  Copyright (c) 2015 David Kuchar. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet weak var defaultTip: UILabel!
    @IBOutlet weak var currentTheme: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
                
        defaultTip.text = DataManager.sharedInstance.getSelectedTip()
        currentTheme.text = DataManager.sharedInstance.getSelectedTheme()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
