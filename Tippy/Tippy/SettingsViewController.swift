//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Kent Ou on 3/8/17.
//  Copyright © 2017 Kent Ou. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

   
    @IBOutlet weak var selectedTip: UISegmentedControl!
    let defaults = NSUserDefaults.standardUserDefaults()
    let defaultTip = "defaultTip"
    
    func getSavedTip() {
        switch(defaults.integerForKey(defaultTip))
        {
        case 0: selectedTip.selectedSegmentIndex = 0
        case 1: selectedTip.selectedSegmentIndex = 1
        case 2: selectedTip.selectedSegmentIndex = 2
        default: break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getSavedTip()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveSelectedTip(sender: AnyObject) {
//        print(selectedTip.selectedSegmentIndex)
        defaults.setInteger(selectedTip.selectedSegmentIndex, forKey: defaultTip)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
