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
    
    var tips: [Int:Bool]
    
    var tipsList: [Int] {
        var list: [Int] = []
        for tipName in tips.keys {
            list.append(tipName)
        }
        
        list.sort(<)
        
        return list
    }
    
    init() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        // set up tip percentages
        if let tipInfo = userDefaults.valueForKey("tips") as? [Int:Bool] {
            tips = tipInfo
        } else {
            // add default data
            
            tips = [Int:Bool]()
            for tip in 5...30 {
                switch tip {
                case 15:
                    tips[tip] = true
                case 20:
                    tips[tip] = true
                case 25:
                    tips[tip] = true
                default:
                    tips[tip] = false
                }
            }
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
        userDefaults.setValue(themes, forKey: "themes")
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
    
//    func addRace(species inSpecies: String, race: String) {
//        if var races = species[inSpecies] {
//            races.append(race)
//            species[inSpecies] = races
//        }
//        
//        saveData()
//    }
//    
//    func removeRace(species inSpecies: String, race inRace: String) {
//        if var races = species[inSpecies] {
//            var index = -1
//            
//            for (idx, race) in enumerate(races) {
//                if race == inRace {
//                    index = idx
//                    break
//                }
//            }
//            
//            if index != -1 {
//                races.removeAtIndex(index)
//                species[inSpecies] = races
//                saveData()
//            }
//            
//        }
//    }
}