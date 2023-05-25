//
//  ContentView.swift
//  BucketList
//
//  Created by Alex Bardi on 5/24/23.
//

import SwiftUI

enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed :(")
    }
}

struct ContentView: View {
    @State var loadingState = LoadingState.loading
    
    var body: some View {
        
        Spacer()
        
        Button("Toggle") {
            switch loadingState {
            case .loading:
                loadingState = .success
            case .success:
                loadingState = .failed
            case .failed:
                loadingState = .loading
            }
        }
        
        Spacer()
        
        switch loadingState {
        case .loading:
            LoadingView()
        case .success:
            SuccessView()
        case .failed:
            FailedView()
        }
        
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
