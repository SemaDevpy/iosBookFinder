//
//  MyCellTableViewCell.swift
//  BookFinder
//
//  Created by Syimyk on 11/3/20.
//  Copyright © 2020 Syimyk. All rights reserved.
//

import UIKit





class MyCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        button.layer.cornerRadius = 5
    }
  
    
    
    @IBOutlet weak var button: UIButton!
    
}
