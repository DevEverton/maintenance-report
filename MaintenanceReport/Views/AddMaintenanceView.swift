//
//  AddMaintenanceView.swift
//  MaintenanceReport
//
//  Created by Everton Carneiro on 24/09/20.
//  Copyright © 2020 Everton Carneiro. All rights reserved.
//

import SwiftUI

struct AddMaintenanceView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var equipments: Equipments

    var equipment: EquipmentViewModel

    var body: some View {
        VStack {
            Text("Add maintenance to: \(equipment.name)")
            Button(action: {
                self.equipments.addMaintenance(MaintenanceViewModel(maintenance: Maintenance(description: "Testing", type: .predictive, date: Date())), to: self.equipment.id)
                print(self.equipment.maintenanceLog.count)
            }){
                Image(systemName: "gear")
            }
        }
    }
}

struct AddMaintenanceView_Previews: PreviewProvider {
    static var previews: some View {
        AddMaintenanceView(equipments: Equipments(), equipment: EquipmentViewModel(equipment: Equipment(name: "Purifier", condition: .good, runningHours: "124", maintenanceLog: [])))
    }
}
