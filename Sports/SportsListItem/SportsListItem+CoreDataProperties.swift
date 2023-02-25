//
//  SportsListItem+CoreDataProperties.swift
//  Sports
//
//  Created by Afnan on 24/02/2023.
//

import Foundation
import CoreData


extension SportsListItem   {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SportsListItem> {
        return NSFetchRequest<SportsListItem>(entityName: "SportsListItem")
    }

    @NSManaged public var name: String?
    @NSManaged public var teamImg: String?
   @NSManaged public var teamKey: Int64
    @NSManaged public var isFav : Bool


}
