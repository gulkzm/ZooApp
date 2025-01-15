//
//  ZooDetailController.swift
//  ZooApp
//
//  Created by Gul Kzm on 09.01.25.
//

import UIKit

class ZooDetailController: UIViewController {
  
    @IBOutlet weak var collection: UICollectionView!
    var context = AppDelegate().persistentContainer.viewContext
    
    var core: CoreData?
    let zooData = ZooData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.dataSource = self
        collection.delegate = self
        
        configureUI()
        zooData.loadData()
        core = CoreData(context: context)
        core?.fetchData()
        
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
        collection.register(UINib(nibName: "\(ZooDetailCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(ZooDetailCell.self)")
    }
}

extension ZooDetailController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        core?.items.count ?? 0
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "\(ZooDetailCell.self)", for: indexPath) as! ZooDetailCell
        let data = core?.items[indexPath.item]
        cell.configure(name: data?.name ?? "", image: data?.image ?? "", aPrice: data?.adultPrice ?? "", chPrice: data?.childPrice ?? "", place: data?.location ?? "")
        return cell
    }
}
