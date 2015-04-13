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
    
    init() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        // set up tip percentages
        if let tipInfo = userDefaults.valueForKey("tips") as? [String:Bool] {
            tips = tipInfo
            println("defaults!!")
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
    }
    
    func saveData() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setValue(tips, forKey: "tips")
        userDefaults.setValue(themes, forKey: "themes")
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
}