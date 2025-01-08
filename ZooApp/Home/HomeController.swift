//
//  HomeController.swift
//  ZooApp
//
//  Created by Gul Kzm on 04.01.25.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
  
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var collection: UICollectionView!
    
    let viewModel = ZooViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        collection.dataSource = self
        collection.delegate = self

        viewModel.getZooList()
        configureUI()
        configureViewModel()
        
        
    }
    
    func configureUI() {
        collection.register(UINib(nibName: "\(ZooCell.self)", bundle: nil), forCellWithReuseIdentifier: "ZooCell")
        table.register(UINib(nibName: "\(CustomCell.self)", bundle: nil), forCellReuseIdentifier: "CustomCell")
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
            self.table.reloadData()
        }
    }
   
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
    if sender.selectedSegmentIndex == 0 {
            table.isHidden = false
            collection.isHidden = true
        } else {
            table.isHidden = true
            collection.isHidden = false
        }
    }
}

extension HomeController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.zoos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(ZooListCell.self)") as! ZooListCell
        cell.configure(titleText: viewModel.zoos[indexPath.row].zooName ?? "",
                       imageName: viewModel.zoos[indexPath.row].zooImage ?? ""
        )
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let controller = storyboard?.instantiateViewController(withIdentifier: "\(AnimalListController.self)") as! AnimalListController
            
            controller.viewModel.place = viewModel.zoos[indexPath.row]
            controller.viewModel.animals = viewModel.zoos[indexPath.row].animals ?? []
            navigationController?.show(controller, sender: nil)
        }
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.zoos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ZooCell.self)", for: indexPath) as! ZooCell
        cell.configure(data: viewModel.zoos[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(AnimalListController.self)") as! AnimalListController
        controller.viewModel.place = viewModel.zoos[indexPath.item]
        controller.viewModel.animals = viewModel.zoos[indexPath.item].animals ?? []
        navigationController?.show(controller, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width / 2 - 20, height: 200)
    }
}

