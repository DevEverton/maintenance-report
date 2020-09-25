//
//  CardView.swift
//  MaintenanceReport
//
//  Created by Everton Carneiro on 17/09/20.
//  Copyright © 2020 Everton Carneiro. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var equipment: EquipmentViewModel
    @ObservedObject var equipments: Equipments
    
    var body: some View {
        NavigationLink(destination: DetailView(equipment: equipment, equipments: equipments)) {
            HStack {
                Image(systemName: "gear")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
                
                VStack(alignment: .leading) {
                    Text("\(equipment.name)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("\(equipment.condition)")
                        .font(.callout)
                    
                }
                Spacer()
                
            }
        }

    
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(equipment: Equipments().list[0], equipments: Equipments())
    }
}
