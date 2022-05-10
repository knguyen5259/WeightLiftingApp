//
//  SecondViewController.swift
//  WeightLiftApp
//
//  Created by Keenan Nguyen on 5/10/22.
//

import UIKit
import CoreData

class SecondViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var Label: UILabel!
    
    var exercises: [Exercise] = []
    var day: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        if (day != "") {
            exercises = Persistance.get(day) ?? []
            Label.text = day
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell2", for: indexPath)
        cell.textLabel?.text = exercises[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Persistance.delete(self.exercises[indexPath.row])
            self.exercises.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    @IBAction func whenButtonPressed(_ sender: UIBarButtonItem) {
        guard let text = textField.text else { return }
        
        for x in exercises {
            if x.name == text {
                return
            }
        }

        guard let excercise = Persistance.save(text, day) else { return }
        exercises.append(excercise)
        tableView.reloadData()
    }
    
}
