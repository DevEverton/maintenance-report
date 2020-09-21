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

struct EquipmentViewModel: Identifiable {
    var id = UUID()
    var equipment: Equipment
    
    var name: String {
        return equipment.name
    }
    
    var condition: String {
        return equipment.condition.rawValue
    }
    var runningHours: String {
        return equipment.runningHours
    }
    var maintenanceLog: [Maintenance] {
        return equipment.maintenanceLog
    }

}

class Equipments: ObservableObject {
    @Published var list: [EquipmentViewModel]
    
    func addEquipment(equipment: Equipment) {
        list.append(EquipmentViewModel(equipment: equipment))
    }
    
    func removeEquipment(removeID: UUID) {
        if let index = list.firstIndex(where: { $0.id == removeID}) {
            list.remove(at: index)
        }
    }
    
    init() {
        list = []
    }
}
