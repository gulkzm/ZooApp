//
//  CustomCell.swift
//  ZooApp
//
//  Created by Gul Kzm on 07.01.25.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(titleText: String, imageName: String) {
        cellImage.image = UIImage(named: imageName)
        cellLabel.text = titleText
    }
}
