//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Seika Hirori on 6/1/23.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order:Order
    
    var body: some View {
        Text("Hello, checking out this 美味しい cake :D")
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
