//
//  blueitTableViewCell.swift
//  blueit
//
//  Created by Mac Mini on 11/29/22.
//

import UIKit

class blueitTableViewCell: UITableViewCell {

    public var post_id: String? = nil
    @IBOutlet weak var subreddit: UILabel!
    @IBOutlet weak var authorlabel: UILabel!
    @IBOutlet weak var headLine: UILabel!
    @IBOutlet weak var content: UILabel!
    
    @IBOutlet weak var imageLink: UILabel!
    
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    
    var isActive:Bool = false
    var isOn:Bool = false
    
    @IBAction func solidupButton(_ sender: Any) {
        if isActive {
            
            isActive = false
            upButton.setImage(UIImage(named:"Upvote-Solid"), for:.normal)
        }
        
        else {
            
            isActive = true
            upButton.setImage(UIImage(named:"Upvote-Outline"), for:.normal)
            
        }
        }
    
    
    @IBAction func soliddownButton(_ sender: Any) {
    
        if isOn {
            
            isOn = false
            downButton.setImage(UIImage(named:"Downvote-Solid"), for:.normal)
        }
        
        else {
            
            isOn = true
            downButton.setImage(UIImage(named:"Downvote-Outline"), for:.normal)
            
        }
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
