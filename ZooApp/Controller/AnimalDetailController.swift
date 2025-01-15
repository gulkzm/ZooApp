//
//  AnimalDetailController.swift
//  ZooApp
//
//  Created by Gul Kzm on 08.01.25.
//

import UIKit

class AnimalDetailController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var effectImage: UIImageView!
    @IBOutlet weak var animalDescriprionLabel: UILabel!
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var lineImage: UILabel!
    @IBOutlet weak var animalImageView: UIImageView!
    
    let viewModel = AnimalDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let animal = viewModel.animalDetail {
            animalImageView.image = UIImage(named: animal.animalImage ?? "")
            animalNameLabel.text = animal.animalName
            animalDescriprionLabel.text = animal.animalDescription
        }
    }
}
