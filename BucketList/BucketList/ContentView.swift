//
//  ContentView.swift
//  BucketList
//
//  Created by Alex Bardi on 5/24/23.
//

import SwiftUI

struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ContentView: View {
    let users = [
        User(firstName: "Zebra", lastName: "Zoof"),
        User(firstName: "Alex", lastName: "Bardi"),
        User(firstName: "Finger", lastName: "Bardi"),
        User(firstName: "Morgan", lastName: "Freeman")
    ].sorted()
    
    var body: some View {
        List(users) { user in
            Text("\(user.firstName) \(user.lastName)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
