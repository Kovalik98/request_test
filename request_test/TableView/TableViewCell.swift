//
//  TableViewCell.swift
//  request_test
//
//  Created by Nazar Kovalik on 31.01.2020.
//  Copyright © 2020 Nazar Kovalik. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var imgTVC: UIImageView!
    @IBOutlet weak var idTVC: UILabel!
    @IBOutlet weak var titleTVC: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
