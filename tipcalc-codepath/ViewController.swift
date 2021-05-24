//
//  ViewController.swift
//  tipcalc-codepath
//
//  Created by Rishabh Tewari on 5/23/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountTextField: UILabel!
    @IBOutlet weak var tipAmountPercentage: UILabel!
    @IBOutlet weak var tipAmountField: UILabel!
    @IBOutlet weak var tipControlPreset: UISegmentedControl!
    @IBOutlet weak var tipControlSlider: UISlider!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var numPeopleLabel: UILabel!
    @IBOutlet weak var numPeopleStepper: UIStepper!
    @IBOutlet weak var splitBill: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        // Do any additional setup after loading the view.
        billAmountTextField.becomeFirstResponder()
    }

    @IBAction func calculateTip(_ sender: Any) {
        //Get initial bill from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.12, 0.15, 0.18, 0.20]
        let tipPercentage = tipPercentages[tipControlPreset.selectedSegmentIndex]
        let tip = bill * tipPercentage
        let total = bill + tip
        
        //Update tip amount label
        tipAmountField.text = String(format: "$%.2f", tip)
        //Update the percentage label
        tipAmountPercentage.text = String(format: "Tip %02d%%", Int(tipPercentage*100))
        //Update total amount
        totalLabel.text = String(format: "%.2f", total)
        //Update the tip Percentage slider when a new option is clicked
        tipPercentageSlider.value = Float(tipPercentage*100)
        splitBill.text = String(format: "%.2f", (total / numPeopleStepper.value))
    }
    
    @IBAction func tipSliderValueChanged(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentage = Int(tipPercentageSlider.value)
        let tip = bill * Double(tipPercentage) * 0.01
         let total = bill + tip
        //Update the percentage label
        tipAmountPercentage.text =  String(format: "Tip %02d%%", Int(tipPercentageSlider.value)
        )
        //Update tip amount label
        tipAmountField.text = String(format: "$%.2f", tip)
        //Update total amount
        totalLabel.text = String(format: "%.2f", total)
        splitBill.text = String(format: "%.2f", (total / numPeopleStepper.value))
    }
    
    @IBAction func numPeopleChanged(_ sender: Any) {
        numPeopleLabel.text = String(format: "%d people in the party", Int(numPeopleStepper.value))
        print(numPeopleStepper.value)
        let splitBillVal = (Double(totalLabel.text!) ?? 1.0) / Double(numPeopleStepper.value)
        splitBill.text = String(splitBillVal)
        
        
    }
    
}

