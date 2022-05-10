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
    
    var exercises: [Exercise] = []
    var day: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        if (day != "") {
            exercises = Persistance.get(day) ?? []
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
