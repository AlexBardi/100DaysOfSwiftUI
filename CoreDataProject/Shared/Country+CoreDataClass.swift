//
//  Country+CoreDataClass.swift
//  CoreDataProject (iOS)
//
//  Created by Alex Bardi on 10/25/22.
//
//

import Foundation
import CoreData

@objc(Country)
public class Country: NSManagedObject {
    public var wrappedShortName: String {
        shortName ?? "Unknown Country"
    }

    public var wrappedFullName: String {
        fullName ?? "Unknown Country"
    }
    
    public var candyArray: [Candy] {
        let set = candy as? Set<Candy> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
}
