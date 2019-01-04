//
//  CheckListTableViewCell.swift
//  CheckkList
//
//  Created by Andrew Yakovenko on 1/4/19.
//  Copyright © 2019 Andrew Yakovenko. All rights reserved.
//

import UIKit

class CheckListTableViewCell: UITableViewCell {

    
    
    
    @IBOutlet weak var checkmarkLabel: UILabel!
    @IBOutlet weak var todoTextLable: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
