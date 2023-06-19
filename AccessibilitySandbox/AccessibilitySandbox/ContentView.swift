//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Alex Bardi on 6/18/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("your score is")
            Text("1000")
        }
        .accessibilityElement(children: .ignore)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
