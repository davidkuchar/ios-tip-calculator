//
//  ViewController.swift
//  TipCalculator
//
//  Created by David Kuchar on 3/23/15.
//  Copyright (c) 2015 David Kuchar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var viewBackground: UIView!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipTextLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalTextLabel: UILabel!
    @IBOutlet weak var tipAmount: UISegmentedControl!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        var formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        billField.placeholder = formatter.currencySymbol
        
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
        
        applyTheme()
        
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
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        var sliderIntValue = Int(sender.value)
        var snapToValue = Float(sliderIntValue)
        if (sender.value - snapToValue) >= 0.5 {
            snapToValue++
        }
        
        sender.setValue(snapToValue, animated: false)
        
        splitLabel.text = "/ \(Int(snapToValue))"
        
        updateTotal()
    }
    
    func updateTotal() {
        var tipPercentages = [0.15, 0.2, 0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var split = Double(splitSlider.value)
        var total = (billAmount + tip) / split
        
        var formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        
//        formatter.locale = NSLocale(localeIdentifier: "es_CL")
//        formatter.locale = NSLocale(localeIdentifier: "es_ES")
        
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
    }
    
    func applyTheme() {
        
        let theme = DataManager.sharedInstance.getSelectedTheme()
        
        let colorSwatch: [UIColor] = [
            UIColor(red: 40/255, green: 50/255, blue: 45/255, alpha: 1.0),
            UIColor(red: 80/255, green: 98/255, blue: 89/255, alpha: 1.0),
            UIColor(red: 159/255, green: 195/255, blue: 176/255, alpha: 1.0),
            UIColor(red: 169/255, green: 208/255, blue: 188/255, alpha: 1.0),
            UIColor(red: 161/255, green: 198/255, blue: 178/255, alpha: 1.0)
        ]
        
        billField.font = UIFont(name: "HelveticaNeue", size: CGFloat(70))
        tipTextLabel.font = UIFont(name: "HelveticaNeue", size: CGFloat(17))
        tipLabel.font = UIFont(name: "HelveticaNeue", size: CGFloat(22))
        totalTextLabel.font = UIFont(name: "HelveticaNeue", size: CGFloat(22))
        totalLabel.font = UIFont(name: "HelveticaNeue", size: CGFloat(30))
        splitLabel.font = UIFont(name: "HelveticaNeue", size: CGFloat(22))
        
        switch theme {
        case "Dark":
        
            view.backgroundColor = colorSwatch[0]
            view.tintColor = colorSwatch[3]
            
            billField.textColor = colorSwatch[3]
            tipTextLabel.textColor = colorSwatch[3]
            tipLabel.textColor = colorSwatch[3]
            totalTextLabel.textColor = colorSwatch[3]
            totalLabel.textColor = colorSwatch[3]
            tipAmount.tintColor = colorSwatch[3]
            tipControl.tintColor = colorSwatch[3]
            splitLabel.textColor = colorSwatch[3]
            splitSlider.tintColor = colorSwatch[3]

        default: //case "Light":
            
            view.backgroundColor = colorSwatch[3]
            view.tintColor = colorSwatch[0]
            
            billField.textColor = colorSwatch[0]
            tipTextLabel.textColor = colorSwatch[0]
            tipLabel.textColor = colorSwatch[0]
            totalTextLabel.textColor = colorSwatch[0]
            totalLabel.textColor = colorSwatch[0]
            tipAmount.tintColor = colorSwatch[0]
            tipControl.tintColor = colorSwatch[0]
            splitLabel.textColor = colorSwatch[0]
            splitSlider.tintColor = colorSwatch[0]
        }
    }
}
