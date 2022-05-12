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
    
    var food = ["Nut Butter Energy Balls": "https://chefsavvy.com/5-ingredient-peanut-butter-energy-bites/", "Peanut Butter and Banana Smoothie": "https://www.wellplated.com/peanut-butter-banana-smoothie/", "Fruit Salad": "https://www.shelovesbiscotti.com/healthy-fruit-salad-recipe/","Vanilla Protien Smoothie": "https://www.amydgorin.com/vanilla-bean-smoothie-high-protein-vanilla-smoothie/", "Cliff Bars": "https://shop.clifbar.com/products/clif-bar-chocolate-chip", "Pedialyte": "https://pedialyte.com/?gclsrc=aw.ds&gclid=EAIaIQobChMIqJ2_p9TV9wIVknxvBB32sAkkEAAYASAAEgIN9fD_BwE", "Better Pizza": "https://www.acouplecooks.com/best-healthy-pizza-recipe/", "Healthy Chicken Quesadillas": "https://www.slenderkitchen.com/recipe/healthy-chicken-quesadillas"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewTwo.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewTwo.dequeueReusableCell(withIdentifier: "myCellTwo", for: indexPath)
        cell.textLabel?.text = Array(food.keys)[indexPath.row]
        return cell
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    
}
