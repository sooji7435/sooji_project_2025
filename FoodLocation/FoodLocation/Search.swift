//
//  Search.swift
//  FoodLocation
//
//  Created by 박윤수 on 3/14/25.
//

import Foundation
import MapKit

class Search {
    let searchRequest = MKLocalSearch.Request()
    let mapRegion = ContentView()
    
    init() {
        searchRequest.naturalLanguageQuery = "Any"
        searchRequest.region = mapRegion.region
    }
    

}
    
    

