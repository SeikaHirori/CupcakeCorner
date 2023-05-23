//
//  section1dot2.swift
//  CupcakeCorner
//
//  Created by Seika Hirori on 5/23/23.
//

import SwiftUI

struct section1dot2: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct section1dot2_Previews: PreviewProvider {
    static var previews: some View {
        section1dot2()
    }
}

class User: ObservableObject, Codable {
    var name: String = "Paul Hudson"
}
