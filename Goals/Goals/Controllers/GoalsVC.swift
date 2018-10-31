//
//  GoalsVC.swift
//  Goals
//
//  Created by Anton Huisamen on 2018/10/24.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var goals: [Goal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreDataObjects()
        tableView.reloadData()
    }
    
    func fetchCoreDataObjects(){
        self.fetch { (complete) in
            if complete {
                if goals.count >= 1 {
                    tableView.isHidden = false
                } else {
                    tableView.isHidden = true
                }
            }
        }
    }
    
    @IBAction func addGoalButtonPressed(_ sender: UIButton) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "GoalVC") else {
            return}
        presentDetail(createGoalVC)
    }
    
}

extension GoalsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell", for: indexPath) as? GoalCell else {
            return UITableViewCell()}
        let goal = goals[indexPath.row]
        cell.configure(goal: goal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexpath)
            in
            self.removeGoal(atIndexpath: indexPath)
            self.fetchCoreDataObjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let addAction = UITableViewRowAction(style: .normal, title: "ADD ONE") { (rowAction, indexpath) in
            self.setProgress(atIndexPath: indexpath)
            tableView.reloadRows(at: [indexpath], with: .automatic)
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        addAction.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        return [deleteAction, addAction]
    }
}

extension GoalsVC {
    
    func setProgress(atIndexPath indexpath: IndexPath) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return}
        let  chosenGoal = goals[indexpath.row]
        
        if chosenGoal.goalProgress < chosenGoal.goalCompletionValue {
            chosenGoal.goalProgress = chosenGoal.goalProgress + 1
        } else { return }
        do {
            try managedContext.save()
            print("succesfully set progress")
        } catch  {
            debugPrint("Could not set progress: \(error.localizedDescription)")
        }
    }
    
    
    func removeGoal (atIndexpath indexpath: IndexPath) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        managedContext.delete(goals[indexpath.row])
        
        do {
            try managedContext.save()
            print("sucsessfully removed goal")
        } catch  {
            debugPrint("Could not remove: \(error.localizedDescription)")
        }
    }
    
    
    func fetch(completion : (_ complete: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        do {
            goals = try managedContext.fetch(fetchRequest)
            completion(true)
        } catch {
            debugPrint("Could not fetch : \(error.localizedDescription)")
            completion(false)
        }
    }
}

