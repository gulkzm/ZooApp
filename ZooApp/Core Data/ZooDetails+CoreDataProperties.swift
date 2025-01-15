//
//  ZooDetails+CoreDataProperties.swift
//  ZooApp
//
//  Created by Gul Kzm on 09.01.25.
//
//

import Foundation
import CoreData


extension ZooDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ZooDetails> {
        return NSFetchRequest<ZooDetails>(entityName: "ZooDetails")
    }

    @NSManaged public var name: String?
    @NSManaged public var adultPrice: String?
    @NSManaged public var childPrice: String?
    @NSManaged public var location: String?
    @NSManaged public var image: String?

}

extension ZooDetails : Identifiable {

}
