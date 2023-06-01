//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Seika Hirori on 5/20/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order:Order = Order()
    
    var body: some View {
        return VStack {
            NavigationStack {
                Form {
                    Section {
                        Picker("Select your cake type", selection: $order.type) {
                            ForEach(Order.types.indices) {
                                Text(Order.types[$0])
                            }
                        }
                        
                        Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                    }
                    
                    Section {
                        Toggle("Any special requests?", isOn: $order.specialRequestEnable.animation())
                        
                        if order.specialRequestEnable {
                            Toggle("Add extra frosting", isOn: $order.extraFrosting)
                            
                            Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
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
