//
//  ContentView.swift
//  BucketList
//
//  Created by Alex Bardi on 5/24/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var mapregion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    @State private var locations = [Location]()
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $mapregion, annotationItems: locations) { location in
                MapMarker(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
            }
                .ignoresSafeArea()
            
            Circle()
                .fill(.blue)
                .opacity(0.3)
                .frame(width: 32, height: 32)
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: mapregion.center.latitude, longitude: mapregion.center.longitude)
                        locations.append(newLocation)
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
