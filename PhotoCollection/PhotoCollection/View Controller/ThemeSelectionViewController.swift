//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Enzo Jimenez-Soto on 4/23/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    @IBAction func selectDarkTheme(_ sender: Any) {             themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    @IBAction func setThemePreferenceToBlue(_ sender: Any) {
    
   themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
}
