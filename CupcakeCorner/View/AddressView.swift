//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Seika Hirori on 6/1/23.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order:Order
    var body: some View {
        Text("Hello, world's best customer :3")
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
