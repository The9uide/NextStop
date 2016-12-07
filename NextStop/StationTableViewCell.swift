//
//  StationTableViewCell.swift
//  NextStop
//
//  Created by Mayuree on 12/4/16.
//  Copyright © 2016 it56070048.it.kmitl.ac.th. All rights reserved.
//

import UIKit

class StationTableViewCell: UITableViewCell {

    @IBOutlet weak var StationName: UILabel!
    @IBOutlet weak var StationId: UILabel!
    @IBOutlet weak var icon: UIImageView!
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
