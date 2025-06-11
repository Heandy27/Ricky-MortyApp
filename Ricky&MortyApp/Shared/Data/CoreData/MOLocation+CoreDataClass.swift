//
//  MOLocation+CoreDataClass.swift
//  Ricky&MortyApp
//
//  Created by Andy Heredia on 5/6/25.
//
//

import Foundation
import CoreData

@objc(MOLocation)
public class MOLocation: NSManagedObject {

}


extension MOLocation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MOLocation> {
        return NSFetchRequest<MOLocation>(entityName: "CDLocation")
    }

    @NSManaged public var name: String?
    @NSManaged public var url: String?
    @NSManaged public var character: MOCharacter?

}

extension MOLocation : Identifiable {

}
