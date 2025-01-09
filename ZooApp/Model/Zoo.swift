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
    let adultPrice: String?
    let chilPrice: String?
    let location: String?
    let animals: [Animal]?
}

struct Animal: Codable {
    let animalName: String?
    let animalImage: String?
    let animalDescription: String?
}
