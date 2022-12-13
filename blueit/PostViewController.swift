//
//  PostViewController.swift
//  blueit
//
//  Created by Mac Mini on 12/6/22.
//

import UIKit

class PostViewController: UIViewController, UITextViewDelegate {

    
    @IBOutlet weak var TypeTitle: UITextView!
    @IBOutlet weak var TypeText: UITextView!
    @IBOutlet weak var characterCount: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TypeText.becomeFirstResponder()
        TypeText.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func subreddit(_ sender: Any) {
    }
    
    
    

    @IBAction func exit(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func post(_ sender: Any) {
        if(!TypeText.text.isEmpty){
            HomeTableViewController.feedEndpoint = "/r/\(TypeText.text ?? "askreddit")/new"
        }
        self.dismiss(animated: true)
        
    }
    
    // MARK: - Text view delegate
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let totalLength = textView.text.count + text.count
        if totalLength <= 40000 {
            return true
        } else {
            return false
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        characterCount.text = "\(40000 - textView.text.count) characters left:"
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
