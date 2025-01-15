//
//  ZooDetailCell.swift
//  ZooApp
//
//  Created by Gul Kzm on 09.01.25.
//

import UIKit

class ZooDetailCell: UICollectionViewCell {

    @IBOutlet weak var zooTitle: UILabel!
    @IBOutlet weak var adultPrice: UILabel!
    @IBOutlet weak var childPrice: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var photo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(name: String, image: String, aPrice: String, chPrice: String, place: String) {
        zooTitle.text = name
        photo.image = .init(named: image)
        adultPrice.text = aPrice
        childPrice.text = chPrice
        location.text = place
    }
}
