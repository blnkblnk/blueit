//
//  ProfileViewController.swift
//  blueit
//
//  Created by Orion Medina on 12/13/22.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var ProfileImageView: UIImageView!
    @IBOutlet weak var ProfileUsername: UILabel!
    
    
    @IBOutlet weak var Karma: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadUserData()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUserData()
        // Do any additional setup after loading the view.
    }
    
    func loadUserData(){
        Task{
            let user = try await
            RedditAPICaller.client.getIdentity()
            let username = user?["name"] as? String ?? "name" //selftext
            self.ProfileUsername.text = username
            let userlikes = user?["total_karma"] as? Int ?? 0
            
            self.Karma.text = String(userlikes)
            print(user?.keys as Any)
            print(user?["created"] as Any)
            print(user?["created_utc"] as Any)
            // Create a Date object from the epoch time
            let time = TimeInterval(integerLiteral: (user?["created"] as? Int64 ?? 0))
            let date = Date(timeIntervalSince1970: time)

            // Create a date formatter to convert the date to a string
            let dateFormatter = DateFormatter()

            // Set the date format to the desired string format
            dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"

            // Convert the date to a string
            let timeString = dateFormatter.string(from: date)
            print(timeString)
        }
    
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
