//
//  Zoo.swift
//  ZooApp
//
//  Created by Gul Kzm on 06.01.25.
//

import Foundation

struct Zoo: Codable {
    let zooName: String?
    let zooImage: String?
    let animals: [Animal]?
    var isFavorite: Bool = false
}

struct Animal: Codable {
    let animalName: String?
    let animalImage: String?
    let animalDescription: String?
    var isFavorite: Bool = false
}
