//
//  ViewController.swift
//  Prework
//
//  Created by Yujing Chen on 8/5/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControlSliderBar: UISlider!
    @IBOutlet weak var currentPer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func calculateTip(_ sender: Any) {
        //get bill amount from text input field
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //get total tip by multiplying tip * tip percentage
        let tipPercentage = [0.15, 0.18, 0.2]
        let cur = tipPercentage[tipControl.selectedSegmentIndex]
        //update view of current percentage
        currentPer.text = String(format: "%.2f", cur * 100) + String(" %")
        tipControlSliderBar.value = Float(cur)
        let tip = bill * cur
        let total = bill + tip
        
        //update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        //update total Amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    @IBAction func calculateTipBySlidingBar(_ sender: Any) {
        //get bill amount from text input field
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //get total tip by multiplying tip * tip percentage
        let cur = Double(tipControlSliderBar.value)
        let tip = bill * cur
        
        //update the view accordingly
        currentPer.text = String(format: "%.2f %", cur * 100) + String(" %")
        
        let total = bill + tip
        
        //update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        //update total Amount
        totalLabel.text = String(format: "$%.2f", total)
    }
}

