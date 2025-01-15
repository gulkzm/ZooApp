//
//  ViewModel.swift
//  ZooApp
//
//  Created by Gul Kzm on 06.01.25.
//

import Foundation

class ZooViewModel {

    var zoos = [Zoo]()
    var filteredZoos = [Zoo]()
    var favoriteZoos: [Zoo] {
        return filteredZoos.filter { $0.isFavorite }
    }
    
    var success: (() -> Void)?
    var errorHandler: ((String) -> Void)?
    
    func getZooList() {
        if let url = Bundle.main.url(forResource: "ZooFile", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            do {
                zoos = try JSONDecoder().decode([Zoo].self, from: data)
                filteredZoos = zoos
                loadFavorites()
                
                success?()
            } catch {
                errorHandler?(error.localizedDescription)
            }
        }
    }
    
    func toogleFavorite(at index:  Int) {
        filteredZoos[index].isFavorite.toggle()
        saveFavorites()
    }
    
    func saveFavorites() {
        let favorites = favoriteZoos
        UserDefaultsHelper.shared.saveFavorites(favorites)
    }
    
    func loadFavorites() {
        let favorites = UserDefaultsHelper.shared.loadFavorites()
        for i in 0..<zoos.count {
            zoos[i].isFavorite = favorites.contains(where: { $0.zooName == zoos[i].zooName})
            }
        filteredZoos = zoos
        }
    }


