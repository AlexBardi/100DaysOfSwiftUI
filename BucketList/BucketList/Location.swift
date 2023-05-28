//
//  Location.swift
//  BucketList
//
//  Created by Alex Bardi on 5/27/23.
//

import Foundation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
}
