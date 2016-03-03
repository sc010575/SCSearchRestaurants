//
//  Master+CoreDataProperties.swift
//  
//
//  Created by Suman Chatterjee on 21/02/2016.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Master {

    @NSManaged var name: String?
    @NSManaged var postcode: String?
    @NSManaged var rating: NSDecimalNumber?
    @NSManaged var url: String?
    @NSManaged var address: String?
    @NSManaged var city: String?

}
