//
//  CustomTableViewCell.swift
//  CustomTableTest
//
//  Created by 张佳盈 on 2020/2/25.
//  Copyright © 2020 lottagrandpa. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var houseLabel: UILabel!
    @IBOutlet var actorLabel: UILabel!
    @IBOutlet var actorImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
