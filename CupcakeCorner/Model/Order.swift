//
//  Order.swift
//  CupcakeCorner
//
//  Created by Seika Hirori on 6/1/23.
//

import SwiftUI

class Order: ObservableObject, Codable {
    // Confirming to Codable
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }
    
    init() { }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        
        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
        
        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
        
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)
        
        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
        
        
    }
    
    // Cake
    static let types: [String] = [
        "Vanilla",
        "Strawberry",
        "Chocolate",
        "Rainbow"
    ]
    
    @Published var type: Int = 0
    @Published var quantity: Int = 3
    
    @Published var specialRequestEnable: Bool = false {
        didSet {
            if specialRequestEnable == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting: Bool = false
    @Published var addSprinkles: Bool = false
    
    // Address
    @Published var name: String = ""
    @Published var streetAddress: String = ""
    @Published var city: String = ""
    @Published var zip:String  = ""
    
    var hasValidAddress: Bool {
        
        // Original version
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            var emptyFields:String = ""
            
            if name.isEmpty {
                emptyFields += "name\n"
            }
            
            if streetAddress.isEmpty {
                emptyFields += "street address\n"
            }
            
            if city.isEmpty {
                emptyFields += "city\n"
            }
            
            if zip.isEmpty {
                emptyFields += "zip\n"
            }
            
            print("The following fields are empty:")
            print(emptyFields)
            return false
        }
        
        // Challenge #1
        // rev #1: Try to remove whitespace to check if the string is empty.
        let trimmedName = name.trimmingCharacters(in: .whitespaces)
        let trimmedStreetAddress = streetAddress.trimmingCharacters(in: .whitespaces)
        let trimmedCity = city.trimmingCharacters(in: .whitespaces)
        let trimmedZip = zip.trimmingCharacters(in: .whitespaces)
              
        if trimmedName.isEmpty || trimmedStreetAddress.isEmpty || trimmedCity.isEmpty || trimmedZip.isEmpty {
            
            var onlyWhiteSpace: String = ""
            
            if trimmedName.isEmpty {
                onlyWhiteSpace += "name\n"
            }
            
            if trimmedStreetAddress.isEmpty {
                onlyWhiteSpace += "street address\n"
            }
            
            if trimmedCity.isEmpty {
                onlyWhiteSpace += "city\n"
            }
            
            if trimmedZip.isEmpty {
                onlyWhiteSpace += "zip\n"
            }
            
            print("The following fields contain only whitespace:")
            print(onlyWhiteSpace)
            
            return false
        }
        

        
        return true
    }
    
    // Cost
    var cost: Double {
        // $2 per cake
        var cost:Double = Double(quantity) * 2
        
        // complicated cakes cost more
        cost += (Double(type) / 2)
        
        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // $0.50/cake for spinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
}

