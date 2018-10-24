//
//  GoalVC.swift
//  Goals
//
//  Created by Anton Huisamen on 2018/10/24.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import UIKit

class GoalVC: UIViewController {
    
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermButton: UIButton!
    @IBOutlet weak var longTermButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var goalType: GoalType = GoalType.shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.bindToKeyboard()
        shortTermButton.setSelectedColor()
        longTermButton.deselectedColor()
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func shortTermButton(_ sender: UIButton) {
        GoalType.shortTerm
        shortTermButton.setSelectedColor()
        longTermButton.deselectedColor()
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismissDetail()
    }
    
    @IBAction func longTermButtonPressed(_ sender: UIButton) {
        GoalType.longTerm
        longTermButton.setSelectedColor()
        shortTermButton.deselectedColor()
    }
    
    
}
