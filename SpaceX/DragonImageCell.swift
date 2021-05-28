//
//  DragonImageCell.swift
//  test
//
//  Created by ovr on 24.05.2021.
//

import UIKit
import Kingfisher

class DragonImageCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(imageURL: URL?) {
        image.kf.setImage(with: imageURL)
    }
}
