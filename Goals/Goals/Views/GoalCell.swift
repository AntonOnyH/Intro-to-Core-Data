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
    
    func configureCell(description: String, goalType: GoalType.RawValue, goalProgressAmount: Int) {
        self.goalDiscription.text = description
        self.goalType.text = goalType
        self.goalProgress.text = String(describing: goalProgressAmount)
    }

}
