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
    
    var list = ["Oatmeal", "Coffee", "Oysters", "Almonds", "Raisins", "Water", "Salmon", "Ginger", "Tomato Juice", "DIY Sports Drink", "Whole Fruit Smoothie", "Nut butter energy balls", "PB&J Sandwich", "Homemade Granola Bar" , "Dried Aprictos", "Low-fat Cottage Cheese", "A Slice of Toast with Jam or Honey", "Dry Cereal", "Chocolate Milk" , "Greek Yogurt with Berries", "Caffeinated Tea with Honey", "Green Juice"]
    
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
