//
//  UserDefaults.swift
//  ZooApp
//
//  Created by Gul Kzm on 15.01.25.
//

import Foundation
class UserDefaultsManager {
    enum UserDefaultsTypes: String, CaseIterable {
        case start = "isOnboarded"
        case onboarded = "isOnb"
    }
    func setValue (value: Any, key: UserDefaultsTypes) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
        
    }
    func getBool(key: UserDefaultsTypes) -> Bool {
        UserDefaults.standard.bool(forKey: key.rawValue)
    }
    
}

