//
//  FeedViewController.swift
//  blueit
//
//  Created by Eli Young on 11/15/22.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var loginInfo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        loginInfo.text = "API token = " + (RedditAPICaller.sessionToken ?? "nil")
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
