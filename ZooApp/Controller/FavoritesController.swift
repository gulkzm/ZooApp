//
//  FavoritesController.swift
//  ZooApp
//
//  Created by Gul Kzm on 15.01.25.
//

import UIKit

class FavoritesController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    
    let viewModel = ZooViewModel()
    let viewModelAnimal = AnimalViewModel()
    var isGridList = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource = self
        collection.delegate = self
        configureUI()
        viewModelAnimal.configureAnimalsData()
        viewModel.getZooList()
        viewModel.success = {
            self.collection.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModelAnimal.configureAnimalsData()
        viewModel.getZooList()
        collection.reloadData()
    }
    
    func configureUI() {
        collection.register(UINib(nibName: "\(ZooCell.self)", bundle: nil),forCellWithReuseIdentifier: "\(ZooCell.self)")
    }
   
    @IBAction func rightBarButtonAction(_ sender: UIBarButtonItem) {
        isGridList = !isGridList
        collection.reloadData()
    }
}

extension FavoritesController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isGridList ? viewModelAnimal.favoriteAnimals.count : viewModel.favoriteZoos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ZooCell.self)", for: indexPath) as! ZooCell
        
        if isGridList {
            guard indexPath.item < viewModelAnimal.favoriteAnimals.count else {
                
                return cell
            }
            cell.configure(data: viewModelAnimal.favoriteAnimals[indexPath.item])
        } else {
            guard indexPath.item < viewModel.favoriteZoos.count else {
                
                return cell
            }
            cell.configure(data: viewModel.favoriteZoos[indexPath.item])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(AnimalListController.self)") as! AnimalListController
        controller.viewModel.place = viewModel.favoriteZoos[indexPath.item]
        controller.viewModel.animals = viewModel.favoriteZoos[indexPath.item].animals ?? []
        navigationController?.show(controller, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width / 2 - 20, height: 200)
    }
}

