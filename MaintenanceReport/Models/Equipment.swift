//
//  Equipment.swift
//  MaintenanceReport
//
//  Created by Everton Carneiro on 16/09/20.
//  Copyright © 2020 Everton Carneiro. All rights reserved.
//

import Foundation
import Combine


struct Equipment {
    var name: String
    var condition: EquipmentCondition
    var runningHours: String
    var maintenanceLog: [Maintenance]
    
    mutating func addMaintenance(description: String, type: MaintenanceType, date: Date) {
        maintenanceLog.append(Maintenance(description: description, type: type, date: date))
    }
}

struct Maintenance {
    var description: String
    var type: MaintenanceType
    var date: Date
}

class Equipments: ObservableObject {
    @Published var list: [Equipment]
    
    init() {
        list = [Equipment(name: "Purifier", condition: .veryGood, runningHours: "45672", maintenanceLog: [Maintenance(description: "Replaced friction pads.", type: .corrective ,date: Date())])]
    }
}