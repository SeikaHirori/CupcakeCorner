//
//  UserData.swift
//  CupcakeCorner
//
//  Created by Seika Hirori on 5/23/23.
//

import Foundation


class UserData: ObservableObject, Codable {
    @Published var name: String = "Paul Hudson"
    
    enum CodingKeys: CodingKey {
        case name
    }
    
}
