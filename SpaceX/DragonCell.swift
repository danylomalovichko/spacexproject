//
//  DragonCell.swift
//  test
//
//  Created by ovr on 23.05.2021.
//

import UIKit
import Kingfisher

class DragonCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dragonImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }

    func setup(dragon: Dragon) {
        titleLabel.text = dragon.name
        dragonImage.kf.setImage(with: dragon.images[0])
    }
}
