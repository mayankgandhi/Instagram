//
//  PostsTableViewCell.swift
//  Instagram
//
//  Created by Mayank Gandhi on 16/08/18.
//  Copyright © 2018 Mayank Gandhi. All rights reserved.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var PostimageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
