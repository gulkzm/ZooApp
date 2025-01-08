//
//  ZooListCell.swift
//  ZooApp
//
//  Created by Gul Kzm on 07.01.25.
//

import UIKit

class ZooListCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var zooImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func configure(titleText: String, imageName: String) {
        titleLabel.text = titleText
        zooImage.image = UIImage(named: imageName)
    }
}
