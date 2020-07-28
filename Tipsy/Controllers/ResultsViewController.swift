//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Miguel Moya on 7/27/20.
//  Copyright © 2020 Miguel Moya. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var amountOfPeople: Int?
    var tip: Double?
    var amount: Double?

    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountLabel.text = "$\(String(format: "%.2f", amount!))"
        messageLabel.text = "Split between \(amountOfPeople!) people, with \(tip! * 100)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
