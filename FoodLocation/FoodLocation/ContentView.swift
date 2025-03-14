//
//  ContentView.swift
//  FoodLocation
//
//  Created by 박윤수 on 12/31/24.
//
import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var mapRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780), // 서울
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    
    private var locationmanager = LocationManager()
    
    var body: some View {
        VStack{
            Map() {
                UserAnnotation()
            }
            .mapControls {
                MapScaleView()
                MapUserLocationButton()
                MapCompass()
            }
            .onAppear {
                locationmanager.requestLocationPermission()
            }
            .onChange(of : locationmanager.region) { oldValue, newValue in
                withAnimation {
                    position = .region(locationmanager.region)
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}

