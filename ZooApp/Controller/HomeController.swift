//
//  HomeController.swift
//  ZooApp
//
//  Created by Gul Kzm on 04.01.25.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var collection: UICollectionView!
    
    let viewModel = ZooViewModel()
    
    var isGridList = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureViewModel()   
        
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.configureWithTransparentBackground()
        navigationAppearance.backgroundColor = .white
        navigationController?.navigationBar.scrollEdgeAppearance = navigationAppearance
        navigationController?.navigationBar.standardAppearance = navigationAppearance
        navigationController?.navigationBar.compactAppearance = navigationAppearance
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithTransparentBackground()
        tabBarAppearance.backgroundColor = .verylight
        navigationController?.tabBarItem.scrollEdgeAppearance = tabBarAppearance
        navigationController?.tabBarItem.standardAppearance = tabBarAppearance
    }
    
    func configureUI() {
        collection.dataSource = self
        collection.delegate = self
        searchTextField.delegate = self
        
        collection.register(UINib(nibName: "\(ZooCell.self)", bundle: nil), forCellWithReuseIdentifier: "ZooCell")
        collection.register(UINib(nibName: "\(ListCell.self)", bundle: nil), forCellWithReuseIdentifier: "ListCell")
    }
    
    func configureViewModel() {
        viewModel.getZooList()
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
    
    
    @IBAction func rightBarButtonAction(_ sender: Any) {
        isGridList = !isGridList
        collection.reloadData()
    }
    
    @IBAction func searchAction(_ sender: Any) {
        guard let searchText = searchTextField.text?.lowercased() else { return }
        if searchText.isEmpty {
            viewModel.filteredZoos = viewModel.zoos
        } else {
            viewModel.filteredZoos = viewModel.zoos.filter { $0.zooName!.lowercased().contains(searchText)}
        }
        collection.reloadData()
    }
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITextFieldDelegate, ZooCellDelegate {
    
    func didTapFavoriteButton(at cell: ZooCell) {
        guard let indexPath = collection.indexPath(for: cell) else { return }
        viewModel.toogleFavorite(at: indexPath.item)
        collection.reloadItems(at: [indexPath])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.filteredZoos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isGridList {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ListCell.self)", for: indexPath) as! ListCell
            cell.configure(data: viewModel.filteredZoos[indexPath.item])
            return cell
           
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ZooCell.self)", for: indexPath) as! ZooCell
            cell.configure(data: viewModel.filteredZoos[indexPath.item])
            cell.delegate = self
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(AnimalListController.self)") as! AnimalListController
        controller.viewModel.place = viewModel.filteredZoos[indexPath.item]
        controller.viewModel.animals = viewModel.filteredZoos[indexPath.item].animals ?? []
        navigationController?.show(controller, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if isGridList {
            return .init(width: collectionView.frame.width, height: 60)
        } else {
            return .init(width: collectionView.frame.width / 2 - 20, height: 200)
        }
    }
}

