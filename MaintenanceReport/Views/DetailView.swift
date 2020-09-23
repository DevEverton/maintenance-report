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
        VStack(alignment: .leading) {
            HStack {
                Text(equipment.name)
                    .fontWeight(.bold)
                    .padding()
                    .font(.largeTitle)
                Spacer()
                Button(action: {}){
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 20, height: 20)
                }.padding()
            }
                

            ZStack {
                Rectangle()
                    .fill(Color(red: 0.86, green: 0.80, blue: 0.74))
                    .frame(width: 350, height: 70)
                    .cornerRadius(8)
                HStack {
                    VStack(alignment: .leading) {
                        Text("Status: \(equipment.condition)")
                            .fontWeight(.thin)
                        Text("Hours: \(equipment.runningHours)")
                            .fontWeight(.thin)
                    }.padding(.leading, 20)
                    Spacer()
                }
            }
            Text("Maintenance History")
                .font(.headline)
                .padding()
            List(equipment.maintenanceLog) { maintenance in
                Text(maintenance.description)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(equipment: EquipmentViewModel(equipment:  Equipment(name: "Purifier", condition: .good, runningHours: "345", maintenanceLog: [])))
    }
}
