//
//  CarData.swift
//  Revolt
//
//  Created by 박윤수 on 3/30/25.
//

import Foundation

struct ElectricCar: Identifiable {
    let id = UUID()
    let brand: String
    let model: String
    let imageUrl: String
    let price: String?
    let availableCount: Int
}

let sampleCars: [ElectricCar] = [
    ElectricCar(brand: "GENESIS", model: "Electrified G80", imageUrl: "g80_image", price: nil, availableCount: 0),
    ElectricCar(brand: "GENESIS", model: "GV60", imageUrl: "gv60_image", price: nil, availableCount: 0),
    ElectricCar(brand: "GENESIS", model: "Electrified GV70", imageUrl: "gv70_image", price: "5,250만원", availableCount: 2),
    ElectricCar(brand: "Chevrolet(GM)", model: "Bolt EV", imageUrl: "bolt_ev_image", price: nil, availableCount: 0),
    ElectricCar(brand: "Tesla", model: "Model 3", imageUrl: "model3_image", price: "6,500만원", availableCount: 3)
]
