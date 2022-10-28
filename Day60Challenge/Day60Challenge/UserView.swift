//
//  UserView.swift
//  Day60Challenge
//
//  Created by Alex Bardi on 10/27/22.
//

import SwiftUI

struct UserView: View {
    let user: User
    
    var body: some View {
        Text(user.name)
            .bold()
            .padding()
        List(user.friends, id: \.id) { friend in
            Text(friend.name)
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static let user = User(id: UUID(), isActive: true, name: "Alex", age: 23, company: "Epic", email: "Alex.Bardi@hey.com", address: "123 Main", about: "I'm a software engineer!", registered: Date(), tags: ["Cool", "Dude"], friends: [Friend(id: UUID(), name: "Steph")])
    static var previews: some View {
        UserView(user: user)
    }
}
