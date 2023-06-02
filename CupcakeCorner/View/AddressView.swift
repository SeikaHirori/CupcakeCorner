//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Seika Hirori on 6/1/23.
//

import SwiftUI

struct AddressView: View {
//    @State var order:Order
    @ObservedObject var order: ClassOrder
    
    var body: some View {
        return VStack {
            Form {
                
                // Address info
                Section("Address") {
                    TextField("Name", text: $order.uniqueOrder.name)
                    TextField("Street Address", text: $order.uniqueOrder.streetAddress)
                    TextField("City", text: $order.uniqueOrder.city)
                    TextField("Zip", text: $order.uniqueOrder.zip)
                }
                
                // Checkout cart
                Section {
                    NavigationLink {
                        CheckoutView(order: order)
                    } label: {
                        Text("Check out")
                    }
                }
                .disabled(order.uniqueOrder.hasValidAddress == false)

            }
        }
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: ClassOrder())
    }
}
