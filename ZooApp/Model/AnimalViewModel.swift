//
//  AnimalViewModel.swift
//  ZooApp
//
//  Created by Gul Kzm on 06.01.25.
//

import Foundation

class AnimalViewModel {
    var place: Zoo?
    var animals = [Animal]()
    var filteredAnimals = [Animal]()
    
    var favoriteAnimals: [Animal] {
        return filteredAnimals.filter { $0.isFavorite }
    }
    
    var success: (() -> Void)?
    var errorHandler: ((String) -> Void)?
    
    func configureAnimalsData() {
        animals = place?.animals ?? []
        loadAnimalFavorites()
    }
    
    func toogleFavorite(at index:  Int) {
        filteredAnimals[index].isFavorite.toggle()
        saveAnimalFavorites()
    }
    
    func saveAnimalFavorites() {
        let favorites = favoriteAnimals
        UserDefaultsHelper.shared.saveAnimalFavorites(favorites)
    }
    
    func loadAnimalFavorites() {
        let favorites = UserDefaultsHelper.shared.loadAnimalFavorites()
        for i in 0..<animals.count {
            animals[i].isFavorite = favorites.contains(where: { $0.animalName == animals[i].animalName })
        }
        filteredAnimals = animals
    }
}
