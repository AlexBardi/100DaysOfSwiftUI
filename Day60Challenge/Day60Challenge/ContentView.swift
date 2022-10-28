//
//  ContentView.swift
//  Day60Challenge
//
//  Created by Alex Bardi on 10/26/22.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    @State private var loading = "Loading"
    
    var body: some View {
        Text(loading)
        List(users, id: \.id) { user in
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.headline)
                Text(user.email)
            }
        }
        .task {
            await loadData()
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
                loading = "Done loading!"
            } else {
                loading = "Decode Failed"
            }
        } catch {
            print("Invalid Data")
            print(error)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
