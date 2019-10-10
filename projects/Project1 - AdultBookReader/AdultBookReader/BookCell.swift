//
//  BookCell.swift
//  AdultBookReader
//
//  Created by Varun Narayanswamy on 10/5/19.
//  Copyright © 2019 Varun Narayanswamy LPC. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var BookCurrent: UILabel!
    @IBOutlet weak var BookName: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
