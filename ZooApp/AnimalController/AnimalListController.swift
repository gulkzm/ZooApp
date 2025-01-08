//
//  AnimalListController.swift
//  ZooApp
//
//  Created by Gul Kzm on 06.01.25.
//

import UIKit

class AnimalListController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var collection: UICollectionView!
    let viewModel = AnimalViewModel()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource = self
        collection.delegate = self
       
        configureUI()
        configureViewModel()
    }
    
    func configureUI() {
        title = viewModel.place?.zooName
        collection.register(UINib(nibName: "\(ZooCell.self)", bundle: nil),forCellWithReuseIdentifier: "\(ZooCell.self)")
    }
    
    func configureViewModel() {
        viewModel.configureAnimalsData()
        viewModel.errorHandler = { errorMessage in
         let alertController = UIAlertController()
            let action = UIAlertAction(title: errorMessage, style: .default)
            alertController.addAction(action)
            self.present(alertController, animated: true)
        }
        viewModel.success = {
            self.collection.reloadData()
        }
    }
    
}

extension AnimalListController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.animals.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ZooCell.self)", for: indexPath) as! ZooCell
        let data = viewModel.animals[indexPath.item]
        cell.configure(name: data.animalName ?? "", 
                       photo: data.animalImage ?? "")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width / 2 - 20, height: 200)
    }
}
