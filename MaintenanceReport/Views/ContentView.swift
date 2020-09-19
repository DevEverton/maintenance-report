//
//  ContentView.swift
//  MaintenanceReport
//
//  Created by Everton Carneiro on 16/09/20.
//  Copyright © 2020 Everton Carneiro. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @EnvironmentObject var equipments: Equipments
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach(equipments.list) { equipment in
                    CardView(equipment: equipment)
                    
                }
                Spacer()
            }.navigationBarTitle("My equipments")
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Equipments())
    }
}
