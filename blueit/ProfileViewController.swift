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
