//
//  blueitTableViewCell.swift
//  blueit
//
//  Created by Mac Mini on 11/29/22.
//

import UIKit

class blueitTableViewCell: UITableViewCell {

    @IBOutlet weak var subreddit: UILabel!
    @IBOutlet weak var authorlabel: UILabel!
    @IBOutlet weak var headLine: UILabel!
    @IBOutlet weak var content: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
