//
//  StationDetailTableViewCell.swift
//  NextStop
//
//  Created by Mayuree on 12/5/16.
//  Copyright © 2016 it56070048.it.kmitl.ac.th. All rights reserved.
//

import UIKit

class StationDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var StationNameLabel: UILabel!
    @IBOutlet weak var StationDetailLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var StationIdLabel: UILabel!
    @IBOutlet weak var iconLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
