//
//  FileManager-DocumentsDirectory.swift
//  BucketList
//
//  Created by Alex Bardi on 6/7/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
