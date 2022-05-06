//
//  ThridViewController.swift
//  WeightLiftApp
//
//  Created by Dylan Stukin on 5/2/22.
//

import UIKit
import SafariServices

class ThridViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var tableViewTwo: UITableView!
    
    var list = ["Nut Butter Energy Balls", "Peanut Butter and Banana Smoothie", "Fruit Salad","Vanilla Protien Smoothie", "Cliff Bars", "Pedialyte", "Better Pizza", "Healthy Chicken Quesadillas", "Costco Rotisseriee Chicken"]
    
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
 
    @IBAction func buttonPressed(_ sender: Any) {
        if let urk = URL(string: "https://www.blendtec.com/blogs/news/5-energy-pre-workout-smoothie-recipes") {
            let sorryVC = SFSafariViewController(url: urk)
            
            present(sorryVC, animated: true, completion: nil)
        }
    }
    
}
