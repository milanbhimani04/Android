//
//  tblcell.swift
//  practicecurd
//
//  Created by ENGRAVER FAMILY on 06/12/24.
//

import UIKit

class tblcell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var surname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
