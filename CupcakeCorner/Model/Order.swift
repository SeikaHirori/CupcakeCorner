//
//  Order.swift
//  CupcakeCorner
//
//  Created by Seika Hirori on 6/1/23.
//

import SwiftUI

class Order: ObservableObject {
    static let types: [String] = [
        "Vanilla",
        "Strawberry",
        "Chocolate",
        "Rainbow"
    ]
    
    @Published var type: Int = 0
    @Published var quantity: Int = 3
    
    @Published var specialRequestEnable: Bool = false
    @Published var extraFrosting: Bool = false
    @Published var addSprinkles: Bool = false
}

