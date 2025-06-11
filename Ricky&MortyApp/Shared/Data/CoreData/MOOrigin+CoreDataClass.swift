//
//  MOOrigin+CoreDataClass.swift
//  Ricky&MortyApp
//
//  Created by Andy Heredia on 5/6/25.
//
//

import Foundation
import CoreData

@objc(MOOrigin)
public class MOOrigin: NSManagedObject {

}


extension MOOrigin {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MOOrigin> {
        return NSFetchRequest<MOOrigin>(entityName: "CDOrigin")
    }

    @NSManaged public var name: String?
    @NSManaged public var url: String?
    @NSManaged public var character: MOCharacter?

}

extension MOOrigin : Identifiable {

}
