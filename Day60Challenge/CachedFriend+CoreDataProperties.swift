//
//  CachedFriend+CoreDataProperties.swift
//  Day60Challenge
//
//  Created by Alex Bardi on 10/27/22.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var cachedUser: CachedUser?

}

extension CachedFriend : Identifiable {

}
