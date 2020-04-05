//
//  ItemCell.swift
//  GameForKids
//
//  Created by Lê Duy on 4/5/20.
//  Copyright © 2020 Lê Duy. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func parseData(imageName:String = "",title:String = "") {
        gameImage.image = UIImage(named: imageName)
        gameTitle.text = title
    }
    
}
