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
        
        viewModel.filteredAnimals = viewModel.animals
        
        collection.dataSource = self
        collection.delegate = self
        searchTextField.delegate = self
        
        configureUI()
        configureViewModel()
    }
//    override func viewWillAppear(_ animated: Bool) {
//        viewModel.loadAnimalFavorites()
//        collection.reloadData()
//    }
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
    
    @IBAction func searchAction(_ sender: Any) {
        
        guard let searchText = searchTextField.text?.lowercased() else { return }
    
        if searchText.isEmpty {
            viewModel.filteredAnimals = viewModel.animals
        } else {
            viewModel.filteredAnimals = viewModel.animals.filter { $0.animalName!.lowercased().contains(searchText) }
        }
        collection.reloadData()
        
    }
}

extension AnimalListController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITextFieldDelegate, ZooCellDelegate {
    
    func didTapFavoriteButton(at cell: ZooCell) {
        guard let indexPath = collection.indexPath(for: cell) else { return }
        viewModel.toogleFavorite(at: indexPath.item) 
        collection.reloadItems(at: [indexPath])
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.filteredAnimals.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ZooCell.self)", for: indexPath) as! ZooCell
        let data = viewModel.filteredAnimals[indexPath.item]
        cell.configure(name: data.animalName ?? "",
                       photo: data.animalImage ?? "", isFavorite: data.isFavorite)
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedAnimal = viewModel.animals[indexPath.row]
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(AnimalDetailController.self)") as! AnimalDetailController
        controller.viewModel.animalDetail = viewModel.filteredAnimals[indexPath.item]
        controller.viewModel.animals = viewModel.filteredAnimals
        navigationController?.show(controller, sender: nil)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width / 2 - 20, height: 200)
    }
    
}
