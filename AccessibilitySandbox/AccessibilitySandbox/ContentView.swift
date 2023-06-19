//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Alex Bardi on 6/18/23.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 20
    
    var body: some View {
        VStack {
            Text("Value \(value)")
            
            Button("Increment") {
                value += 1
            }
            
            Button("Decrement") {
                value -= 1
            }
        }
        .accessibilityElement()
        .accessibilityLabel("Value")
        .accessibilityValue(String(value))
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                value += 1
            case .decrement:
                value -= 1
            default:
                print("Not handled")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
