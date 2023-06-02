//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Seika Hirori on 5/20/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var currentOrder:ClassOrder = ClassOrder()
    
    var body: some View {
        return VStack {
            NavigationStack {
                List {
                    Section {
                        Picker("Select your cake type", selection: $currentOrder.uniqueOrder.type) {
                            ForEach(currentOrder.uniqueOrder.types.indices) {
                                Text(currentOrder.uniqueOrder.types[$0])
                            }
                        }
                        
                        Stepper("Number of cakes: \(currentOrder.uniqueOrder.quantity)", value: $currentOrder.uniqueOrder.quantity, in: 3...20)
                    }
                    
                    Section {
                        Toggle("Any special requests?", isOn: $currentOrder.uniqueOrder.specialRequestEnable.animation())
                        
                        if currentOrder.uniqueOrder.specialRequestEnable {
                            Toggle("Add extra frosting", isOn: $currentOrder.uniqueOrder.extraFrosting)
                            
                            Toggle("Add extra sprinkles", isOn: $currentOrder.uniqueOrder.addSprinkles)
                        }
                    }
                    
                    Section {
                        NavigationLink {
                            AddressView(order: currentOrder)
                        } label: {
                            Text("Delivery details")
                        }
                    }
                }
                .navigationTitle("Cupcake Corner")
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
