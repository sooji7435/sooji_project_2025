//
//  Search.swift
//  FoodLocation
//
//  Created by 박윤수 on 3/14/25.
//

import Foundation
import MapKit

class Search {
    
    func search() {
        let searchRequest = MKLocalSearch.Request()
        
        searchRequest.naturalLanguageQuery = "coffee"
        
        let search = MKLocalSearch(request: searchRequest)
        search.start { response, error in
            guard let response = response else {
                print("Error: \(error ?? NSError())")
                return
            }
            for item in response.mapItems {
                if let name = item.name,
                   let location = item.placemark.location {
                    print("\(name): \(location.coordinate.latitude)m \(location.coordinate.longitude)")
                }
            }
        }
    }

}
    
    

