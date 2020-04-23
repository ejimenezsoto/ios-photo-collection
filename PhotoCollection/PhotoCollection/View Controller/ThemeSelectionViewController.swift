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

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
     
     }
     */
 
    @IBAction func selectDarkTheme(_ sender: Any) {             themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func setThemePreferenceToBlue(_ sender: Any) {
    
   themeHelper?.setThemePreferenceToBlue()
        dismiss(animated: true, completion: nil)
    }
    
}
