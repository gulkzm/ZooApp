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
    
    var success: (() -> Void)?
    var errorHandler: ((String) -> Void)?
    
    func configureAnimalsData() {
        animals = place?.animals ?? []
    }
    
    
}
