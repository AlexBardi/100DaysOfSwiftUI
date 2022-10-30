//
//  Day60ChallengeApp.swift
//  Day60Challenge
//
//  Created by Alex Bardi on 10/26/22.
//

import SwiftUI

@main
struct Day60ChallengeApp: App {
    @StateObject var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
