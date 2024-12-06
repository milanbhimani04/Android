//
//  tblViewCell.swift
//  firstTask
//
//  Created by student on 13/11/24.
//  Copyright © 2024 student. All rights reserved.
//

import UIKit

class tblViewCell: UITableViewCell {

    @IBOutlet weak var bikeCompany: UILabel!
    @IBOutlet weak var bikePrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
