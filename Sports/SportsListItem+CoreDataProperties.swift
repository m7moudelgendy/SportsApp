//
//  SportsListItem+CoreDataProperties.swift
//  
//
//  Created by Mina on 22/02/2023.
//
//

import Foundation
import CoreData


extension SportsListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SportsListItem> {
        return NSFetchRequest<SportsListItem>(entityName: "SportsListItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var teamImg: String?
    

}
