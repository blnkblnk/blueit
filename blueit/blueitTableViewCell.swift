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
    
    
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    
    
    @IBAction func solidupButton(_ sender: Any) {
    }
        var soliduped:Bool = false
        
        func setSolidup(_ isSoliduped:Bool) {
            soliduped = isSoliduped
            if (soliduped) {
                upButton.setImage(UIImage(named: "Upvote Solid"), for: UIControl.State.normal)
            }
            else {
                upButton.setImage(UIImage(named: "Upvote Outline"), for: UIControl.State.normal)
            }
        }
    
    
    @IBAction func soliddownButton(_ sender: Any) {
    }
        var soliddowned:Bool = false
    
    func setSoliddown(_ isSoliddowned:Bool) {
        soliddowned = isSoliddowned
        if (soliddowned) {
            downButton.setImage(UIImage(named: "Downvote Solid"), for: UIControl.State.normal)
        }
        else {
            downButton.setImage(UIImage(named: "Downvote Outline"), for: UIControl.State.normal)
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
