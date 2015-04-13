//
//  ViewController.swift
//  TipCalculator
//
//  Created by David Kuchar on 3/23/15.
//  Copyright (c) 2015 David Kuchar. All rights reserved.
//


//TODO:

//1. Remember the bill amount across app restarts. After an extended period of time, clear the state. This is a UI trick that Apple uses with the Spotlight app. If you return there a minute later, it will show your most recent search. if you return 10 minutes later, it defaults to blank. To implement this, plug into the application lifecycle and track time using NSDate.

//2. Use locale specific currency and currency thousands separators.

//3. Add a light/dark color theme to the settings view. In viewWillAppear, update views with the correct theme colors.

//4. Improve design

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
        
        // load stored bill amount
        
        if let billAmount = DataManager.sharedInstance.getBillAmount() {
            billField.text = billAmount.description
        }
        
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
        
        // load default tip percentage from settings
        
        let defaultTipName = DataManager.sharedInstance.getSelectedTip()
        
        let tipOptions = [
            "15%",
            "20%",
            "25%"
        ]
        
        tipControl.selectedSegmentIndex = find(tipOptions, defaultTipName)!
        
        updateTotal()
        
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
        
        let billAmount = (billField.text as NSString).doubleValue
        DataManager.sharedInstance.setBillAmount(billAmount)
        
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
        
        var formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
//        formatter.locale = NSLocale(localeIdentifier: "es_CL")
//        formatter.locale = NSLocale(localeIdentifier: "es_ES")
        
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
    }
}
