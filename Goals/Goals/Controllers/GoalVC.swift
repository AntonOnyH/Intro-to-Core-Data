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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func shortTermButton(_ sender: UIButton) {
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func longTermButtonPressed(_ sender: UIButton) {
    }
}
