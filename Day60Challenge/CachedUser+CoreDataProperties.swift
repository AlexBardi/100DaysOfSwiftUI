//
//  CachedUser+CoreDataProperties.swift
//  Day60Challenge
//
//  Created by Alex Bardi on 10/27/22.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var tags: String?
    @NSManaged public var registered: Date?
    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var email: String?
    @NSManaged public var company: String?
    @NSManaged public var age: Int16
    @NSManaged public var name: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var id: UUID?
    @NSManaged public var friends: NSSet?
    
    var wrappedTags: String {
        tags ?? ""
    }
    var wrappedRegistered: Date {
        registered ?? Date.distantPast
    }
    var wrappedAbout: String {
        about ?? ""
    }
    var wrappedAddress: String {
        address ?? ""
    }
    var wrappedEmail: String {
        email ?? ""
    }
    var wrappedCompany: String {
        company ?? ""
    }
    var wrappedName: String {
        name ?? ""
    }
    var friendsArray: [CachedFriend] {
        let set = friends as? Set<CachedFriend> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }

}

// MARK: Generated accessors for cachedFriend
extension CachedUser {

    @objc(addCachedFriendObject:)
    @NSManaged public func addToCachedFriend(_ value: CachedFriend)

    @objc(removeCachedFriendObject:)
    @NSManaged public func removeFromCachedFriend(_ value: CachedFriend)

    @objc(addCachedFriend:)
    @NSManaged public func addToCachedFriend(_ values: NSSet)

    @objc(removeCachedFriend:)
    @NSManaged public func removeFromCachedFriend(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
