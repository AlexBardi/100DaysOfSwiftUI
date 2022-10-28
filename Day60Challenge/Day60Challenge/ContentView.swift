//
//  ContentView.swift
//  Day60Challenge
//
//  Created by Alex Bardi on 10/26/22.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    @State private var loaded = false
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            List(users) {user in
                NavigationLink {
                    UserView(user: user)
                } label: {
                    HStack {
                        Circle()
                            .fill(user.isActive ? .green : .red)
                            .frame(width: 30)
                        VStack {
                            Text(user.name)
                                .font(.headline)
                            Text(user.email)
                                .font(.caption)
                        }
                    }
                }
            }
        }
        .navigationTitle("Friends")
        .task {
            if (!loaded) {
                await loadData()
            }
        }
        
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let decodedResponse = try? decoder.decode([User].self, from: data) {
                users = decodedResponse
            }
        } catch {
            dump(error)
            return
        }
        loaded = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
