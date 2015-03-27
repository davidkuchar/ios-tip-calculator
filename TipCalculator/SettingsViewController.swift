//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by David Kuchar on 3/27/15.
//  Copyright (c) 2015 David Kuchar. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipPercentage: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var defaults = NSUserDefaults.standardUserDefaults()
        defaultTipPercentage.selectedSegmentIndex = defaults.integerForKey("defaultTipPercentageIndex")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func tapCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        println("cancel")
    }
    
    @IBAction func tapDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        println("done")
        
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTipPercentage.selectedSegmentIndex, forKey: "defaultTipPercentageIndex")
        defaults.synchronize()
    }
}
