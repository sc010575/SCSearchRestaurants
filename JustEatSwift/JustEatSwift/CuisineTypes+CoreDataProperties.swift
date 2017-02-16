//
//  CuisineTypes+CoreDataProperties.swift
//  
//
//  Created by Suman Chatterjee on 17/03/2016.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension CuisineTypes {

    @NSManaged var coisineId: NSNumber?
    @NSManaged var name: String?
    @NSManaged var isHalal: NSNumber?
    @NSManaged var isNew: NSNumber?
    @NSManaged var isOpenNow: NSNumber?
    @NSManaged var master: Master?

}
