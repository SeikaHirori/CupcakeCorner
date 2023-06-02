//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Seika Hirori on 6/1/23.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order:Order
    
    @State private var confirmationMessage: String = ""
    @State private var showingConfirmation: Bool = false
    
    @State private var errorMessage: String = ""
    @State private var showingError: Bool = false
    
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

                            // Challenge #2
                            Image(systemName: "antenna.radiowaves.left.and.right.slash")
                                .onAppear {
                                    newErrorMessage(newError: phase.error?.localizedDescription)
                                }
                        } else {
                            ProgressView()
                        }
                    }
                    .frame(height: 233)
                    
                    Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                    
                    Button("Place Order") {
                        Task {
                           await placeOrder()
                        }
                    }
                    .padding()
                }
                
            }
            .navigationTitle("Check out")
            .navigationBarTitleDisplayMode(.inline)
            .alert("Thank you!", isPresented: $showingConfirmation) {
                Button("OK") { print(confirmationMessage)}
            } message: {
                Text(confirmationMessage)
            }
            .alert("Error message :O", isPresented: $showingError) {
                Button("OK") { print(errorMessage) }
            } message: {
                Text(errorMessage)
            }
            
        }
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            
            print("Failed to encode order")
            return
        }
        
        let url: URL = URL(string: "https://reqres.in/api/cupcakes")!
        var request:URLRequest = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        request.httpMethod = "Post" // Disabled for testing offline
        
        do {
            let (data,_) = try await URLSession.shared.upload(for: request, from: encoded)
            
            // handle the result
            let decoderOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(decoderOrder.quantity)x \(Order.types[decoderOrder.type].lowercased()) cupercakes is on its way!"
            showingConfirmation = true
            
        } catch {
            print("Checkout failed")
            print("Error: \(error)")
            
            // Challenge #2
            newErrorMessage(newError: error.localizedDescription)
        }
    }
    
    // Challenge #2
    func newErrorMessage(newError : String?) -> Void {
        errorMessage = newError ?? "Something went wrong"
        showingError = true

    }
    
    
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
