//
//  DetailView.swift
//  MaintenanceReport
//
//  Created by Everton Carneiro on 21/09/20.
//  Copyright © 2020 Everton Carneiro. All rights reserved.
//

import SwiftUI

struct DetailView: View {

    let equipment: EquipmentViewModel
    
    var body: some View {
        VStack {
            Text(equipment.name)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(equipment: EquipmentViewModel(equipment:  Equipment(name: "Purifier", condition: .good, runningHours: "345", maintenanceLog: [])))
    }
}
