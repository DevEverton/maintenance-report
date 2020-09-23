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
    var maintenanceLog: [MaintenanceViewModel]

}

struct Maintenance {
    var description: String
    var type: MaintenanceType
    var date: Date
}

struct MaintenanceViewModel: Identifiable {
    var id = UUID()
    var maintenance: Maintenance
    
    var description: String {
        return maintenance.description
    }
    
    var type: MaintenanceType {
        return maintenance.type
    }
    
    var date: Date {
        return maintenance.date
    }
}

class Maintenances: ObservableObject {
    @Published var list: [MaintenanceViewModel]
    
    func addEquipment(maintenance: Maintenance) {
        list.append(MaintenanceViewModel(maintenance: maintenance))
    }
    
    init() {
        list = []
    }
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
    var maintenanceLog: [MaintenanceViewModel] {
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


