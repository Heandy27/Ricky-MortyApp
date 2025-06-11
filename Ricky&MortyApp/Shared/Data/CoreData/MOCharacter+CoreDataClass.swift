//
//  MOCharacter+CoreDataClass.swift
//  Ricky&MortyApp
//
//  Created by Andy Heredia on 5/6/25.
//
//

import Foundation
import CoreData

@objc(MOCharacter)
public class MOCharacter: NSManagedObject {

}


extension MOCharacter {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MOCharacter> {
        return NSFetchRequest<MOCharacter>(entityName: "CDCharacter")
    }

    @NSManaged public var gender: String?
    @NSManaged public var id: Int16
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var species: String?
    @NSManaged public var status: String?
    @NSManaged public var type: String?
    @NSManaged public var episode: NSObject?
    @NSManaged public var location: MOLocation?
    @NSManaged public var origin: MOOrigin?

}

extension MOCharacter : Identifiable {

}
