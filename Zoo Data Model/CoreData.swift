//
//  CoreData.swift
//  ZooApp
//
//  Created by Gul Kzm on 09.01.25.
//

import Foundation
import CoreData

class CoreData {
    var context = AppDelegate().persistentContainer.viewContext
    var items = [ZooDetails]()
    
    var callback: (() -> Void)?
    init(context: NSManagedObjectContext) {
        self.context = context
        
    }
    
    func saveData(zoosDetail: ZoosDetail)  {
        let model = ZooDetails(context: context)
        model.name = zoosDetail.name
        model.image = zoosDetail.image
        model.adultPrice = zoosDetail.adultPrice
        model.childPrice = zoosDetail.childPrice
        model.location = zoosDetail.location
        
        do {
           try context.save()
        } catch {
            print(error.localizedDescription)
        }
//        return model
    }
    
    func fetchData() {
        do {
            items = try context.fetch(ZooDetails.fetchRequest())
            callback?()
        } catch {
            print(error.localizedDescription)
        }
    }
}
