//
//  structOrder.swift
//  CupcakeCorner
//
//  Created by Seika Hirori on 6/2/23.
//

import SwiftUI

struct structOrder: Codable {
    let cake: CakeItem
    let address:Address
}


struct CakeItem: Codable {
    static let types: [String] = [
        "Vanilla",
        "Strawberry",
        "Chocolate",
        "Rainbow"
    ]
    
    var type: Int = 0
    var quantity: Int = 3
    
    var specialRequestEnable: Bool = false {
        didSet {
            if specialRequestEnable == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting: Bool = false
    var addSprinkles: Bool = false
    
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

struct Address:Codable {
    var name: String = ""
    var streetAddress: String = ""
    var city: String = ""
    var zip:String  = ""

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

}
