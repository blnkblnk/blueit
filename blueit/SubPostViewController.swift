//
//  SubPostingViewController.swift
//  blueit
//
//  Created by Orion Medina on 12/13/22.
//

import UIKit

class SubPostViewController: UIViewController, UITextViewDelegate{
    
    @IBOutlet weak var subredditText: UITextView!
    @IBOutlet weak var characterLimit1: UILabel!
    @IBOutlet weak var textTitle: UITextView!
    @IBOutlet weak var textText: UITextView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        subredditText.delegate = self
        textText.delegate = self
        textTitle.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func newPost(_ sender: Any) {
        if(!subredditText.text.isEmpty){
          //  RedditAPICaller.client.submitTextPost(subreddit: "test", title: "test", text: "test")
        }
        if(!textTitle.text.isEmpty){
            
        }
        if(!textText.text.isEmpty){
            
        }
        
        
    }
    
    
    
    
    
    
    
    
    // MARK: - Text view delegate

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let totalLength = textView.text.count + text.count
        if totalLength <= 20 {
            return true
        } else {
            return false
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        characterLimit1.text = "\(20 - textView.text.count) characters left"
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

