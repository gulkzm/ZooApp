//
//  ListCell.swift
//  ZooApp
//
//  Created by Gul Kzm on 10.01.25.
//

import UIKit

class ListCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(data: Zoo) {
        label.text = data.zooName
        image.image = .init(named: data.zooImage ?? "")
    }
    
}
