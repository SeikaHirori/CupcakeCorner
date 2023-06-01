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

        return VStack {
            ScrollView {
                VStack {
                    
                    // This is personal touch for handling and displaying error
                    AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg")) {
                        phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                        } else if phase.error != nil {
                            let errorMessage: String = phase.error?.localizedDescription ?? "Something went wrong"
                            
                            Text("Error: \(errorMessage)")
                        } else {
                            ProgressView()
                        }
                    }
                    .frame(height: 233)
                }
                
            }
            .navigationTitle("Check out")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}