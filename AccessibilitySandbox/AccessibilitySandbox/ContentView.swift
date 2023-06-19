//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Alex Bardi on 6/18/23.
//

import SwiftUI

struct ContentView: View {
    let pictures = [
       "ales-krivec-15949",
       "galina-n-189483",
       "kevin-horstmann-141705",
       "nicolas-tissot-335096"
    ]
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks"
    ]
    
    @State private var selectedPictrure = Int.random(in: 0...3)
    var body: some View {
        Image(pictures[selectedPictrure])
            .resizable()
            .scaledToFit()
            .onTapGesture {
                selectedPictrure = Int.random(in: 0...3)
            }
            .accessibilityLabel(labels[selectedPictrure])
            .accessibilityAddTraits(.isButton)
            .accessibilityRemoveTraits(.isImage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
