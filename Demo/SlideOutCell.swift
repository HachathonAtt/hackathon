//
//  SlideOutCellTableViewCell.swift
//  Demo
//
//  Created by Chengyu_Ovaltine on 7/7/17.
//  Copyright © 2017 Chengyu_Ovaltine. All rights reserved.
//

import UIKit

class SlideOutCell: UITableViewCell {
    @IBOutlet weak var firstPageLabel: UILabel!

    @IBOutlet weak var secondPageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
