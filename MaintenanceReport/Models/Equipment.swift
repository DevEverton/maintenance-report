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
        get { equipment.maintenanceLog }
        set { equipment.maintenanceLog = newValue }
    }
    
//    mutating func addMaintenance(maintenance: MaintenanceViewModel) {
//        self.equipment.maintenanceLog.append(maintenance)
//    }

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
    
    func addMaintenance(_ maintenance: MaintenanceViewModel, to equipmentWithId: UUID){
        if let index = list.firstIndex(where: { $0.id == equipmentWithId }) {
            list[index].maintenanceLog.append(maintenance)
        }
    }
    
    init() {
        list = []
    }
    
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

//TODO: Create setter for maintenancelog and add publisher for equipment inside MaintenanceLog Class
//
//class MaintenanceLog: ObservableObject {
//    //@Published var list: [MaintenanceViewModel]
//    @Published var equipment: EquipmentViewModel
//
//    func addEquipment(maintenance: MaintenanceViewModel, equipment: EquipmentViewModel) {
//        //list.append(MaintenanceViewModel(maintenance: maintenance))
//        self.equipment.maintenanceLog.append(maintenance)
//    }
//
//    init(equipment: EquipmentViewModel) {
//        self.equipment = equipment
//    }
//}




