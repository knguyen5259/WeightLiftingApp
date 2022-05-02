//
//  ThridViewController.swift
//  WeightLiftApp
//
//  Created by Dylan Stukin on 5/2/22.
//

import UIKit

class ThridViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var tableViewTwo: UITableView!
    
    var list = ["Oatmeal", "Coffee", "Oysters", "Almonds", "Raisins", "Water", "Salmon", "Ginger", "Tomato Juice"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewTwo.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewTwo.dequeueReusableCell(withIdentifier: "myCellTwo", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }

}
