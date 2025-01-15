//
//  ZooCell.swift
//  ZooApp
//
//  Created by Gul Kzm on 06.01.25.
//

import UIKit

protocol ZooCellDelegate: AnyObject {
    func didTapFavoriteButton(at cell: ZooCell)
}

class ZooCell: UICollectionViewCell {
    weak var delegate: ZooCellDelegate?

    @IBOutlet private weak var image: UIImageView!
    @IBOutlet private weak var label: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    //back
//    var onFavoriteButtonTapped: ((ZooCell) -> Void)?

    
    private var currentZoo: Zoo?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(data: Zoo) {
        currentZoo = data
        label.text = data.zooName
        image.image = .init(named: data.zooImage ?? "")
        favoriteButton.isSelected = data.isFavorite
                let imageName = data.isFavorite ? "heart.fill" : "heart"
                favoriteButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        delegate?.didTapFavoriteButton(at: self)
//new
//            onFavoriteButtonTapped?(self)
    }
    

    
    func configure(data: Animal) {
        label.text = data.animalName
        image.image = .init(named: data.animalImage ?? "")
        favoriteButton.isSelected = data.isFavorite
                let imageName = data.isFavorite ? "heart.fill" : "heart"
                favoriteButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    func configure(name: String, photo: String, isFavorite: Bool){
        label.text = name
        image.image = .init(named: photo)
        favoriteButton.isSelected = isFavorite
                let imageName = isFavorite ? "heart.fill" : "heart"
                favoriteButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
}
