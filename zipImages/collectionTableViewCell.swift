//
//  collectionTableViewCell.swift
//  zipImages
//
//  Created by Andrew Tsukuda on 1/17/18.
//  Copyright © 2018 Andrew Tsukuda. All rights reserved.
//

import UIKit

class collectionTableViewCell: UITableViewCell {

    @IBOutlet weak var previewImageView: UIImageView!
    
    @IBOutlet weak var imageCollectionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
