//
//  GoalCell.swift
//  Goals
//
//  Created by Anton Huisamen on 2018/10/24.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDiscription: UILabel!
    @IBOutlet weak var goalType: UILabel!
    @IBOutlet weak var goalProgress: UILabel!
    
    func configure(goal: Goal) {
        self.goalDiscription.text = goal.goalDiscription
        self.goalType.text = goal.goalType
        self.goalProgress.text = String(describing: goal.goalProgress)
    }

}
