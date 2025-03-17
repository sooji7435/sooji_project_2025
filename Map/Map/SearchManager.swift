//
//  Search.swift
//  FoodLocation
//
//  Created by 박윤수 on 3/14/25.
//

import Foundation
import MapKit

class SearchManager: ObservableObject {
    @Published var searchResults: [MKMapItem] = []
    
    func search(query: String, region: MKCoordinateRegion) {
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = query
        searchRequest.region = region
        
        let search = MKLocalSearch(request: searchRequest)
        search.start { response, error in
            guard let response = response else {
                print("Error: \(error ?? NSError())")
                return
            }
            self.searchResults = response.mapItems
            
            }
        }
    }
    
    

