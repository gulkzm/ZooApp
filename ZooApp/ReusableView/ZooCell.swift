//
//  ZooCell.swift
//  ZooApp
//
//  Created by Gul Kzm on 06.01.25.
//

import UIKit

class ZooCell: UICollectionViewCell {

    @IBOutlet private weak var image: UIImageView!
    @IBOutlet private weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(data: Zoo) {
        label.text = data.zooName
        image.image = .init(named: data.zooImage ?? "")
    }
    
    func configure(data: Animal) {
        label.text = data.animalName
        image.image = .init(named: data.animalImage ?? "")
    }
    func configure(name: String, photo: String){
        label.text = name
        image.image = .init(named: photo)
    }
    
//    func configure(zoo: String, Image: String, animalName: String, animalImage: String) {
//        zooLabel.text = zoo
//        zooImage.image = .init(named: Image)
//    }
    
}
