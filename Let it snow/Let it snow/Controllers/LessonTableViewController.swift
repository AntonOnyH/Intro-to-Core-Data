//
//  LessonTableViewController.swift
//  Let it snow
//
//  Created by Anton Huisamen on 2018/11/05.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import UIKit

class LessonTableViewController: UITableViewController {
    
    let student = ["Ben", "John", "Mary"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)
        
        cell.textLabel?.text = student[indexPath.row]
        return cell
    }
    
    @IBAction func addStudentAction(_ sender: UIBarButtonItem) {
        present(alertController(actionType: "add"), animated: true, completion: nil)
    }
    
    private func alertController(actionType: String) -> UIAlertController{
        let alertController = UIAlertController(title: "Snow Lesson", message: "Student Info", preferredStyle: UIAlertController.Style.alert)
        
        alertController.addTextField { (textField: UITextField) in
            textField.placeholder = "Name"
        }
        
        alertController.addTextField { (textField: UITextField) in
            textField.placeholder = "Lesson Type: Ski | SnowBoard"
        }
        let defaultAction = UIAlertAction(title: actionType.uppercased(), style: .default) { (action) in
            
        }
        
        let cancelledAction = UIAlertAction(title: "Cancel", style: .default) { (action) in
            
        }
        
        alertController.addAction(defaultAction)
        alertController.addAction(cancelledAction)
        
        return alertController
    }
    
}
