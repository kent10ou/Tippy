//
//  ViewController.swift
//  Tippy
//
//  Created by Kent Ou on 3/6/17.
//  Copyright © 2017 Kent Ou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        [billField.becomeFirstResponder()]
        
        NSLog("bounds.origin.x: %f", billField.bounds.origin.x);
        NSLog("bounds.origin.y: %f", billField.bounds.origin.y);
        NSLog("bounds.size.width: %f", billField.bounds.size.width);
        NSLog("bounds.size.height: %f", billField.bounds.size.height);
        
        NSLog("frame.origin.x: %f", billField.frame.origin.x);
        NSLog("frame.origin.y: %f", billField.frame.origin.y);
        NSLog("frame.size.width: %f", billField.frame.size.width);
        NSLog("frame.size.height: %f", billField.frame.size.height);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        
        let tipPercentages = [0.15, 0.18, 0.20]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        if billField !== "" {
                billField.frame.size.height = CGFloat(145)
        }
    }
}

