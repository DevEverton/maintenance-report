//
//  CardView.swift
//  MaintenanceReport
//
//  Created by Everton Carneiro on 17/09/20.
//  Copyright © 2020 Everton Carneiro. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var equipment: Equipment
    
    var body: some View {
        HStack {
            Image(systemName: "gear")
                .resizable()
                .frame(width: 70, height: 70)
                .padding()
                
            VStack(alignment: .leading) {
                Text("\(equipment.name)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("\(equipment.condition.rawValue)")
                    .font(.callout)
                
            }
            Spacer()

        }
    
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(equipment: Equipments().list[0].equipment)
    }
}