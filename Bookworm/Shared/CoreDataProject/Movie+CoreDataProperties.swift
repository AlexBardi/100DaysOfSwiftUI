//
//  Movie+CoreDataProperties.swift
//  CoreDataProject (iOS)
//
//  Created by Alex Bardi on 8/9/22.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16

}

extension Movie : Identifiable {

}
