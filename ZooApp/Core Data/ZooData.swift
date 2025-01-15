//
//  ZooData.swift
//  ZooApp
//
//  Created by Gul Kzm on 09.01.25.
//

import Foundation
import CoreData

class ZooData {
    let coreData = CoreData(context: AppDelegate().persistentContainer.viewContext)

    func loadData() {
        let zoo1 = ZoosDetail(name: "San Diego Zoo ", image: "sand.image", adultPrice: "$76", childPrice: "$66", location: "San Diego, USA")
        coreData.saveData(zoosDetail: zoo1)
        let zoo2 = ZoosDetail(name: "Singapore Zoo ", image: "singapore.image", adultPrice: "$35", childPrice: "$24", location: "Singapore")
        coreData.saveData(zoosDetail: zoo2)
        let zoo3 = ZoosDetail(name: "Berlin Zoological Garden ", image: "berlin.image", adultPrice: "$16", childPrice: "$7.50", location: "Berlin, Germany")
        coreData.saveData(zoosDetail: zoo3)
        let zoo4 = ZoosDetail(name: "Bronx Zoo ", image: "bronx.image", adultPrice: "$30", childPrice: "$20", location: "New York City, USA")
        coreData.saveData(zoosDetail: zoo4)
        let zoo5 = ZoosDetail(name: "Chester Zoo", image: "chester.image", adultPrice: "$36.50", childPrice: "$27", location: "Chester, UK")
        coreData.saveData(zoosDetail: zoo5)
        let zoo6 = ZoosDetail(name: "Vienna Zoo", image: "vienna.image", adultPrice: "$27", childPrice: "$15.50", location: "Vienna, Austria")
        coreData.saveData(zoosDetail: zoo6)
        let zoo7 = ZoosDetail(name: "Taronga Zoo", image: "taronga.image", adultPrice: "$53", childPrice: "$31", location: "Sydney, Australia")
        coreData.saveData(zoosDetail: zoo7)
        let zoo8 = ZoosDetail(name: "Prague Zoo", image: "prague.image", adultPrice: "$13", childPrice: "$10", location: "Prague, Czech Republic")
        coreData.saveData(zoosDetail: zoo8)
        let zoo9 = ZoosDetail(name: "National Zoological Gardens", image: "africa.image", adultPrice: "$5", childPrice: "$3", location: "Pretoria, South Africa")
        coreData.saveData(zoosDetail: zoo9)
        let zoo10 = ZoosDetail(name: "Beijing Zoo ", image: "beijing.image", adultPrice: "$2", childPrice: "$1", location: "Beijing, China")
        coreData.saveData(zoosDetail: zoo10)
    }
}

