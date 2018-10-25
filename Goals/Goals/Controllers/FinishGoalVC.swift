//
//  FinishGoalVC.swift
//  Goals
//
//  Created by Anton Huisamen on 2018/10/25.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController {

    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    func initData(description: String, type: GoalType){
        self.goalDescription = description
        self.goalType = type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      createGoalBtn.bindToKeyboard()
    }

    @IBAction func createGoalBtnPressed(_ sender: UIButton) {
        print("button was pressed")
        if pointsTextField.text != "" {
            self.save{ (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismissDetail()
    }
    
    func save(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return}
        let goal = Goal(context: managedContext)
        
        goal.goalDiscription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
           try managedContext.save()
            print("succesfully saved data")
            completion(true)
        } catch  {
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
}
