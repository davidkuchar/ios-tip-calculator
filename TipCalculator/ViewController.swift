//
//  ViewController.swift
//  TipCalculator
//
//  Created by David Kuchar on 3/23/15.
//  Copyright (c) 2015 David Kuchar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipAmount: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = String(format: "$%.2f", 0)
        totalLabel.text = String(format: "$%.2f", 0)
//        
//        // Optionally initialize the property to a desired starting value
//        self.firstView.alpha = 0
//        self.secondView.alpha = 1
//        UIView.animateWithDuration(0.4, animations: {
//            // This causes first view to fade in and second view to fade out
//            self.firstView.alpha = 1
//            self.secondView.alpha = 0
//        })
        
//        println("view did load")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        var defaults = NSUserDefaults.standardUserDefaults()
        if defaults.boolForKey("settingsUpdated") {
            tipControl.selectedSegmentIndex = defaults.integerForKey("defaultTipPercentageIndex")
            defaults.setBool(false, forKey: "settingsUpdated")
            updateTotal()
        }
        
//        println("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
//        println("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
//        println("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
//        println("view did disappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
//        println("User editing bill" + billField.text)
        
        updateTotal()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func updateTotal() {
        var tipPercentages = [0.15, 0.2, 0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        //        tipLabel.text = "$\(tip)"
        //        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}
