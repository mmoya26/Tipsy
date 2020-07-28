//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Miguel Moya on 7/27/20.
//  Copyright © 2020 Miguel Moya. All rights reserved.
//

import UIKit

struct TipsyBrain {
    var bill: Bill?
    
    mutating func calculateBill(tip: Double, billAmount: Double, amountOfPeople: Double) {
        let billAmoutDue: Double
        
        if billAmount == 0.0 {
            billAmoutDue = 0
        } else {
            billAmoutDue = (billAmount + (billAmount * tip)) / amountOfPeople
        }
        
        print("------------ SECOND VIEW ------------")
        print("Bill Amount: \(billAmount)")
        print("Split Amount: \(amountOfPeople)")
        print("Tip Percentage: \(tip)")
        print("Bill Amout Due Per Person: \(billAmoutDue)")
        
        bill = Bill(amount: billAmoutDue, tip: tip, amountOfPeople: Int(amountOfPeople))
    }
    
    func getSplitAmount() -> Int {
        return bill?.amountOfPeople ?? 1
    }
    
    func getTipPercentage() -> Double {
        return bill?.tip ?? 0.0
    }
    
    func getPayAmountPerPerson() -> Double {
        return bill?.amount ?? 0.0
    }
}
