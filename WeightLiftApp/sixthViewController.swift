//
//  sixthViewController.swift
//  WeightLiftApp
//
//  Created by furqan amanji on 5/16/22.
//

import UIKit

class sixthViewController: UIViewController, UITableViewDataSource{


    @IBOutlet weak var TableView: UITableView!
    
    var videoworkouts = ["curls", "bench", "squat", "deadlift"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoworkouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell6 = TableView.dequeueReusableCell(withIdentifier: "Cell6", for: indexPath)
        Cell6.textLabel?.text = videoworkouts[indexPath.row]
        return Cell6
        
  
    }
    
}
