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
    var equipment: EquipmentViewModel

    var body: some View {
        Text("Add maintenance to: \(equipment.name)")
    }
}

struct AddMaintenanceView_Previews: PreviewProvider {
    static var previews: some View {
        AddMaintenanceView(equipment: EquipmentViewModel(equipment: Equipment(name: "Purifier", condition: .good, runningHours: "124", maintenanceLog: [])))
    }
}
