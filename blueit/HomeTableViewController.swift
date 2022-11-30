//
//  HomeTableViewController.swift
//  blueit
//
//  Created by Mac Mini on 11/29/22.
//

import UIKit

class HomeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    
    
    @IBAction func onLogout(_ sender: Any) {
        
        self.dismiss(animated: true)
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath)
        return cell
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }


}
