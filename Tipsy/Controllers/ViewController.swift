//
//  ViewController.swift
//  Tipsy
//
//  Created by Miguel Moya on 7/27/20.
//  Copyright © 2020 Miguel Moya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var splitPeopleLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var stepperButton: UIStepper!
    
    var tipsyBrain = TipsyBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
    }
    
    
    @IBAction func tipPercentagePressed(_ sender: UIButton) {
        resetButtons()
        
        sender.isSelected = true
        sender.backgroundColor = UIColor.green
        sender.setTitleColor(.white, for: .normal)
        
        print("Tip Amount: \(sender.currentTitle!)")
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let tip: Double
        let billAmount: Double
        let amountOfPeople = stepperButton.value
        
        if zeroPercentButton.isSelected {
            tip = 0.0
        } else if tenPercentButton.isSelected {
            tip = 0.1
        } else {
            tip = 0.2
        }
        
        print("First Screen Tip Amount: \(tip)")
        
        if billAmountTextField.text == "" {
            billAmount = 0.0
        } else {
            billAmount = Double(String(billAmountTextField.text!.filter { !" \n\t\r".contains($0) })) ?? 0.0
        }
        
        tipsyBrain.calculateBill(tip: tip, billAmount: billAmount, amountOfPeople: amountOfPeople)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        splitPeopleLabel.text = String(format: "%.0f", sender.value)
        print("Split Amount: \(sender.value)")
    }
    
    func resetButtons() {
        
        // Backgrounds and Text Colors
        zeroPercentButton.backgroundColor = UIColor.white
        zeroPercentButton.setTitleColor(.green, for: .normal)
        tenPercentButton.backgroundColor = UIColor.white
        tenPercentButton.setTitleColor(.green, for: .normal)
        twentyPercentButton.backgroundColor = UIColor.white
        twentyPercentButton.setTitleColor(.green, for: .normal)
        
        // iSelected Property
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.amountOfPeople = tipsyBrain.getSplitAmount()
            destinationVC.tip = tipsyBrain.getTipPercentage()
            destinationVC.amount = tipsyBrain.getPayAmountPerPerson()
        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
