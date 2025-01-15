//
//  RegisterViewModel.swift
//  ZooApp
//
//  Created by Gul Kzm on 04.01.25.
//

import Foundation

class RegisterViewModel {
    var users = [User]()
    private let fileManagerAdapter = FileManagerUser()
    
    func getData() {
        fileManagerAdapter.readData { usersData in
            self.users = usersData
        }
    }
    
    func saveUserData(user: User) {
        users.append(user)
        fileManagerAdapter.writeData(user: users)
    }
}
