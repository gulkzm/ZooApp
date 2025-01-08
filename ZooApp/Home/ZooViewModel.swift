//
//  ViewModel.swift
//  ZooApp
//
//  Created by Gul Kzm on 06.01.25.
//

import Foundation

class ZooViewModel {
    var zoos = [Zoo]()
    
    var success: (() -> Void)?
    var errorHandler: ((String) -> Void)?
    
    func getZooList() {
        if let url = Bundle.main.url(forResource: "ZooFile", withExtension: "json"),
            let data = try? Data(contentsOf: url) {
            do {
                
                zoos = try JSONDecoder().decode([Zoo].self, from: data)
                success?()
               
            } catch {
                errorHandler?(error.localizedDescription)
            }
        }
        
            
    }
}
