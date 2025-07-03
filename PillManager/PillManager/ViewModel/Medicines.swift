//
//  File.swift
//  PillManager
//
//  Created by 박윤수 on 6/30/25.
//

import Foundation


struct Medicines: Identifiable, Hashable {
    var id = UUID()
    var iconName: String
    var name: String
    var dosage: String
    var time: Date
    var status: MedicinesStatus
    
}

enum MedicinesStatus {
    case taken, missed, postponed, upcoming
}


