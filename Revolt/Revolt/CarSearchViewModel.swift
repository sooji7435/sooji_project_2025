//
//  CarSearchViewModel.swift
//  Revolt
//
//  Created by 박윤수 on 3/30/25.
//

import SwiftUI

class CarSearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    var filteredCars: [ElectricCar] {
        if searchText.isEmpty {
            return sampleCars
        } else {
            return sampleCars.filter { $0.model.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

