//
//  Candy+CoreDataClass.swift
//  CoreDataProject (iOS)
//
//  Created by Alex Bardi on 10/25/22.
//
//

import Foundation
import CoreData

@objc(Candy)
public class Candy: NSManagedObject {
    public var wrappedName: String {
        name ?? "Unknown Candy"
    }

}
