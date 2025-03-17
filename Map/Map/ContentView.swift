//
//  ContentView.swift
//  FoodLocation
//
//  Created by 박윤수 on 12/31/24.
//
import SwiftUI
import MapKit

struct ContentView: View {
    
    @StateObject private var searchManager = SearchManager()
    @StateObject private var locationmanager = LocationManager()
    
    @State private var position: MapCameraPosition = .automatic
    @State private var searchText: String = ""
    
    
    
    var body: some View {
        VStack{
            TextField("Search", text: $searchText, onCommit: {searchManager.search(query: searchText, region: locationmanager.region)})
            Map(position: $position) {
                UserAnnotation()
            }
            .onChange(of : locationmanager.region) { oldValue, newValue in
                withAnimation {
                    position = .region(newValue)
                }
            }
            .mapControls {
                MapScaleView()
                MapUserLocationButton()
                MapCompass()
            }
            
            .onAppear {
                locationmanager.requestLocationPermission()
            }
            
            }
            
        }
    }

#Preview {
    ContentView()
}

