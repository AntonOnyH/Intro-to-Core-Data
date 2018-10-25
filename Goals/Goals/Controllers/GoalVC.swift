//
//  GoalVC.swift
//  Goals
//
//  Created by Anton Huisamen on 2018/10/24.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import UIKit
import CoreData

class GoalVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var goalTextView: UITextField!
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
        if goalTextView.text != "" && goalTextView.text != "What is your goal" {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC else {return}
            finishGoalVC.initData(description: goalTextView.text!, type: goalType)
            presentingViewController?.presentSecondaryDetail(finishGoalVC)
        }
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
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
