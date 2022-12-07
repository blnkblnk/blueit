//
//  PostViewController.swift
//  blueit
//
//  Created by Mac Mini on 12/6/22.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func subreddit(_ sender: Any) {
    }
    
    
   
    @IBOutlet weak var TypeTitle: UITextView!
    
    
    @IBOutlet weak var TypeText: UITextView!
    

    @IBAction func exit(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func post(_ sender: Any) {
        if(!TypeText.text.isEmpty){
            //RedditAPICaller.client?.post
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
