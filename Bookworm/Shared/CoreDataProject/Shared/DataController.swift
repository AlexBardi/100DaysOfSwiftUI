//
//  DataController.swift
//  Tests macOS
//
//  Created by Alex Bardi on 8/9/22.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    let container = NSPersistentContainer(name: "CoreDataProject")
}
