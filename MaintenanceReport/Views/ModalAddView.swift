//
//  ModalAddView.swift
//  MEHandBook
//
//  Created by Everton Carneiro on 02/09/20.
//  Copyright © 2020 Everton Carneiro. All rights reserved.
//

import SwiftUI

struct ModalAddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var equipments: Equipments

    
    @State var equipmentName = ""
    @State var status = ""
    @State var runningHours = ""
    
    var body: some View {
        VStack {
            
            VStack(alignment: .leading) {
                Text("Name")
                TextField("Equipment", text: $equipmentName)
            }.padding()
            .padding(.top, 50.0)
            VStack(alignment: .leading) {
                Text("Status")
                TextField("Good condition", text: $status)
            }.padding()
            VStack(alignment: .leading) {
                Text("Running Hours")
                TextField("123456", text: $runningHours)
            }.padding()
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                self.equipments.addEquipment(equipment: Equipment(name: self.equipmentName, condition: EquipmentCondition(rawValue: self.status) ?? .good, runningHours: self.runningHours, maintenanceLog: []))
                
            }){
                Text("Add")
            }
            .frame(width: 100.0, height: 30.0)
            .background(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/)
            .accentColor(Color.white)
            .cornerRadius(5.0)
            .shadow(radius: 4)
            
            Spacer()
        }
    }
    

}

struct ModalAddView_Previews: PreviewProvider {
    static var previews: some View {
        ModalAddView(equipments: Equipments())
    }
}
