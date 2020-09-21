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
    @State var isPresentingModal = false

    
    var body: some View {
        NavigationView {
            List {
                ForEach(equipments.list) { equipment in
                    CardView(equipment: equipment)
                    
                }
                Spacer()
            }
            .navigationBarTitle("My equipments")
            .navigationBarItems(trailing: Button(action: {
                self.isPresentingModal.toggle()
            }){
                Image(systemName: "plus")
            }.sheet(isPresented: $isPresentingModal ){
                ModalAddView(equipments: self.equipments)
                }
            )

            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Equipments())
    }
}
