//
//  LoginViewController.swift
//  blueit
//
//  Created by Eli Young on 11/15/22.
//

import UIKit

class LoginViewController: UIViewController {

    
    
    @IBAction func onLogin(_ sender: Any) {
        
        
        
        let oauthURL = URL(string: "https://www.reddit.com/api/v1/authorize?client_id=fGLcC77TVgO0idNwa_TNqQ&response_type=code&state=iosApp&redirect_uri=blueit://a&duration=temporary&scope=read")!
        UIApplication.shared.open(oauthURL)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
