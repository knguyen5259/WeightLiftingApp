//
//  ViewController.swift
//  WeightLiftApp
//
//  Created by Keenan Nguyen on 4/26/22.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var days: [String] = ["Monday" , "Tuesday" , "Wednesday" , "Thursday" , "Friday" , "Saturday"  , "Sunday"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = days[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //
    }
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        if let url = URL(string: "https://www.youtube.com/watch?v=cQO2V65eK3M&t=205s") {
            let safariVC = SFSafariViewController(url: url)
            
            present(safariVC, animated: true, completion: nil)
        }
            
    }
    
}
