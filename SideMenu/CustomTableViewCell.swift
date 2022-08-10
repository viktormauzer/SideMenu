//
//  CustomTableViewCell.swift
//  SideMenu
//
//  Created by Viktor Mauzer on 05.08.2022..
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet var avatarLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var senderLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarLabel.layer.masksToBounds = true
        avatarLabel.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
