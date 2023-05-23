//
//  SendReceive.swift
//  CupcakeCorner
//
//  Created by Seika Hirori on 5/23/23.
//

import Foundation

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}
