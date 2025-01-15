//
//  AnimalDetailViewModel.swift
//  ZooApp
//
//  Created by Gul Kzm on 08.01.25.
//

import Foundation
class AnimalDetailViewModel {
    var animalDetail: Animal?
    var animals = [Animal]()
    
    var success: (() -> Void)?
    var errorHandler: ((String) -> Void)?
    
}
