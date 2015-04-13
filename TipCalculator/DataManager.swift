//
//  DataManager.swift
//  TipCalculator
//
//  Created by David Kuchar on 4/11/15.
//  Copyright (c) 2015 David Kuchar. All rights reserved.
//

import Foundation

class DataManager {
    
    struct Static {
        static var onceToken : dispatch_once_t = 0
        static var instance : DataManager? = nil
    }
    
    class var sharedInstance : DataManager {
        dispatch_once(&Static.onceToken) {
            Static.instance = DataManager()
        }
        return Static.instance!
    }
    
    var themes: [String:Bool]
    
    var themeList: [String] {
        var list: [String] = []
        for themeName in themes.keys {
            list.append(themeName)
        }
        
        list.sort(<)
        
        return list
    }
    
    var tips: [String:Bool]
    
    var tipsList: [String] {
        var list: [String] = []
        for tipName in tips.keys {
            list.append(tipName)
        }
        
        list.sort(<)
        
        return list
    }
    
    var billAmount: [String:AnyObject]
    
    init() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        // set up tip percentages
        if let tipInfo = userDefaults.valueForKey("tips") as? [String:Bool] {
            tips = tipInfo
        } else {
            // add default data
            
            tips = [String:Bool]()
//            for tip in 5...30 {
//                switch tip {
//                case 15:
//                    tips[tip] = true
//                case 20:
//                    tips[tip] = true
//                case 25:
//                    tips[tip] = true
//                default:
//                    tips[tip] = false
//                }
//            }
            tips["15%"] = false
            tips["20%"] = true
            tips["25%"] = false
        }
        
        // set up themes
        if let themeInfo = userDefaults.valueForKey("themes") as? [String:Bool] {
            themes = themeInfo
        } else {
            // add default data
            themes = [
                "Light": true,
                "Dark" : false,
            ]
        }
        
        // set up billAmount
        if let billAmountInfo = userDefaults.objectForKey("billAmount") as? [String:AnyObject] {
            billAmount = billAmountInfo
        } else {
            // add default data
            billAmount = [
                "value": 0,
                "timestamp": NSDate()
            ]
        }
    }
    
    func saveData() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        userDefaults.setValue(tips, forKey: "tips")
        userDefaults.setValue(themes, forKey: "themes")
        userDefaults.setValue(billAmount, forKey: "billAmount")
    }
    
    func getSelectedTip() -> String {
        for (tipName, selected) in tips {
            if selected {
                return tipName
            }
        }
        return "20%"
    }
    
    func isTipSelected(tipName: String) -> Bool {
        if let selected = tips[tipName] as Bool? {
            return selected
        } else {
            return false
        }
    }
    
    func selectTip(selectedTipName: String) {
        for tipName in tips.keys {
            tips[tipName] = tipName == selectedTipName
        }
        
        saveData()
    }
    
    func getSelectedTheme() -> String {
        for (themeName, selected) in themes {
            if selected {
                return themeName
            }
        }
        return "Light"
    }
    
    func isThemeSelected(themeName: String) -> Bool {
        if let selected = themes[themeName] as Bool? {
            return selected
        } else {
            return false
        }
    }
    
    func selectTheme(selectedThemeName: String) {
        for themeName in themes.keys {
            themes[themeName] = themeName == selectedThemeName
        }
        
        saveData()
    }
    
    func getBillAmount() -> Double? {
        // load timestamp from last time bill amount was changed
        
        let timeSinceLastChanged = NSDate().timeIntervalSinceDate(billAmount["timestamp"] as! NSDate)
        
        println(String(format: "Time Since Last Changed: %.0f seconds", timeSinceLastChanged))
        
        // only load stored bill amounts that are younger than ten minutes old
        
        let billAmountValue = billAmount["value"] as! Double
        
        if billAmountValue > 0 && timeSinceLastChanged < 600 {
            
            println(String(format: "Stored Bill Amount: $%.2f", billAmountValue))
            
            return billAmountValue
        } else {
            return nil
        }
    }
    
    func setBillAmount(newBillAmount: Double) {
        billAmount = [
            "value": newBillAmount,
            "timestamp": NSDate()
        ]
        
        saveData()
    }
}