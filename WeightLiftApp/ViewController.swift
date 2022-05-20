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
        
        let alert = UIAlertController(title: "Welcome to WeightLiftApp 1.0", message: nil, preferredStyle: UIAlertController.Style.alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default) { action in
        }
        
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
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
        guard let identifier = segue.identifier else { return }
        if identifier == "SecondViewControlledSegue" {
            guard let selectedRow = tableView.indexPathForSelectedRow?.row else {return}
            let nvc = segue.destination as! SecondViewController
            nvc.day = days[selectedRow]
        }
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        if let url = URL(string: "https://www.youtube.com/watch?v=cQO2V65eK3M&t=205s") {
            let safariVC = SFSafariViewController(url: url)
            
            present(safariVC, animated: true, completion: nil)
        }
            
    }
    
}
