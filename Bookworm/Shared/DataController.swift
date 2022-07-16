//
//  DataController.swift
//  Bookworm
//
//  Created by Alex Bardi on 7/14/22.
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
    
    let container = NSPersistentContainer(name: "Bookworm")
}
