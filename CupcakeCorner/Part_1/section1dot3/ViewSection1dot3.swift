//
//  ViewSection1dot3.swift
//  CupcakeCorner
//
//  Created by Seika Hirori on 5/23/23.
//

import SwiftUI

struct ViewSection1dot3: View {
    @State private var results: [Result] = [Result]()
    
    var body: some View {
        return VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            List(results, id: \.trackId) { item in
                VStack(alignment: .leading) {
                    Text(item.trackName)
                        .font(.headline)
                    Text(item.collectionName)
                }
            }
            .task {
                await loadData()
            }
        }
        
    }
    
    func loadData() async {
        
    }
}

struct ViewSection1dot3_Previews: PreviewProvider {
    static var previews: some View {
        ViewSection1dot3()
    }
}
