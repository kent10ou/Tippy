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
    
    @IBOutlet weak var personsSlider: UISlider!
    @IBOutlet weak var personsLabel: UILabel!
    @IBOutlet weak var splitTotalLabel: UILabel!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    let defaultTip = "defaultTip"

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        getSavedTip()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    func getSavedTip() {
        print("defaults", defaults.integerForKey(defaultTip))
        switch(defaults.integerForKey(defaultTip))
        {
        case 0: tipControl.selectedSegmentIndex = 0
        case 1: tipControl.selectedSegmentIndex = 1
        case 2: tipControl.selectedSegmentIndex = 2
        default: break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("view did load")
        [billField.becomeFirstResponder()]
        
        NSLog("bounds.origin.x: %f", billField.bounds.origin.x);
        NSLog("bounds.origin.y: %f", billField.bounds.origin.y);
        NSLog("bounds.size.width: %f", billField.bounds.size.width);
        NSLog("bounds.size.height: %f", billField.bounds.size.height);
        
        NSLog("frame.origin.x: %f", billField.frame.origin.x);
        NSLog("frame.origin.y: %f", billField.frame.origin.y);
        NSLog("frame.size.width: %f", billField.frame.size.width);
        NSLog("frame.size.height: %f", billField.frame.size.height);
        
        getSavedTip()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        let currentValue = Int(sender.value)
        if currentValue == 1 {
            personsLabel.text = "\(currentValue) person"
        } else {
            personsLabel.text = "\(currentValue) people"
        }
    }

    @IBAction func calculateTip(sender: AnyObject) {
        
        let tipPercentages = [0.15, 0.18, 0.20]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        let persons = Double(Int(personsSlider.value))
        let splitTotal = total / persons
            
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        splitTotalLabel.text = String(format: "$%.2f",  splitTotal)
        
//        if billField !== "" {
//                billField.frame.size.height = CGFloat(145)
//        }
    }
}

