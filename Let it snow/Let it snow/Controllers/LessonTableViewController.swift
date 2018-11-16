//
//  LessonTableViewController.swift
//  Let it snow
//
//  Created by Anton Huisamen on 2018/11/05.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import UIKit
import CoreData

class LessonTableViewController: UITableViewController {
    
    var moc: NSManagedObjectContext? {
        didSet {
            if let moc = moc {
                lessonService = LessonService(moc: moc)
            }
        }
    }
    
    //Mark: - Private Properties
    private var studentList = [Student]()
    private var lessonService: LessonService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)
        
        cell.textLabel?.text = studentList[indexPath.row]
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
        let defaultAction = UIAlertAction(title: actionType.uppercased(), style: .default) { [weak self](action) in
            guard let studentName = alertController.textFields![0].text, let lesson = alertController.textFields?[1].text else { return }
            
            if actionType.caseInsensitiveCompare("add") == .orderedSame {
                if let lessonType = LessonType(rawValue: lesson.lowercased()) {
                    self?.lessonService?.addStudent(name: studentName, for: lessonType, completion: { (success, students) in
                        if success {
                           self?.studentList = students
                        }
                    })
                }
            }
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        let cancelledAction = UIAlertAction(title: "Cancel", style: .default) { (action) in
            
        }
        
        alertController.addAction(defaultAction)
        alertController.addAction(cancelledAction)
        
        return alertController
    }
    
}
