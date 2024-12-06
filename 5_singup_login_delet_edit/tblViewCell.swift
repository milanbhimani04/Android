//
//  tblViewCell.swift
//  task5
//
//  Created by student on 22/11/24.
//  Copyright © 2024 student. All rights reserved.
//

import UIKit

class tblViewCell: UITableViewCell {

    @IBOutlet weak var tName: UILabel!
    @IBOutlet weak var tAddress: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
