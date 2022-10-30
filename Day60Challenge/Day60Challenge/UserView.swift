//
//  UserView.swift
//  Day60Challenge
//
//  Created by Alex Bardi on 10/27/22.
//

import SwiftUI

struct UserView: View {
    let user: CachedUser
    
    var body: some View {
        Text(user.wrappedName)
            .bold()
            .padding()
        List(user.friendsArray, id: \.id) { friend in
            Text(friend.wrappedName)
        }
    }
}

