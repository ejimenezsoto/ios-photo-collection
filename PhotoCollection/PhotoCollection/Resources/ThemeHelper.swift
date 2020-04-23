//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Enzo Jimenez-Soto on 4/23/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey: String = "themePreferenceKey"
    
    var themePreference: String? {
        UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToBlue() {
        UserDefaults.standard.set("Blue", forKey: themePreferenceKey)
    }
}
