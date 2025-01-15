//
//  UserDefaultsHelper.swift
//  ZooApp
//
//  Created by Gul Kzm on 14.01.25.
//

import Foundation
class UserDefaultsHelper {
    static let shared = UserDefaultsHelper()
    private let favoritesKey = "FavoriteZoos"
    private let favoritesKeyAnimal = "FavoriteAnimals"
    
    private init() {}
    
    func saveFavorites(_ favorites: [Zoo]) {
        if let data = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.set(data, forKey: favoritesKey)
        }
    }
    
    func loadFavorites() -> [Zoo] {
        if let data = UserDefaults.standard.data(forKey: favoritesKey),
           let favorites = try? JSONDecoder().decode([Zoo].self, from: data) {
            return favorites
        }
        return []
    }
    
    func saveAnimalFavorites(_ favorites: [Animal]) {
        if let data = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.set(data, forKey: favoritesKeyAnimal)
        }
    }
    func loadAnimalFavorites() -> [Animal] {
        if let data = UserDefaults.standard.data(forKey: favoritesKeyAnimal),
           let favoriteAnimals = try? JSONDecoder().decode([Animal].self, from: data) {
            return favoriteAnimals
        }
        return []
    }
}

