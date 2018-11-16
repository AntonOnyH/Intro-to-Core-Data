//
//  ViewController.swift
//  The List
//
//  Created by Anton Huisamen on 2018/11/12.
//  Copyright © 2018 antonsolo. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    var people: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "The List"
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    @IBAction func addname(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "New Name", message: "Add a new name", preferredStyle:.alert)
        alertController.addTextField { (nameTextField) in
            nameTextField.placeholder = "Name"
        }
        alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: { (save) in
            let name = alertController.textFields![0].text
            self.people.append(name!)
            self.tableview.reloadData()
        }))
        present(alertController, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = people.count
        let cell = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = person.hashValue(value(forKeyPath: "name") as? String)
        return cell
    }
    
    
}
