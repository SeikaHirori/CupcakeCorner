//
//  validatingFormsView.swift
//  CupcakeCorner
//
//  Created by Seika Hirori on 6/1/23.
//

import SwiftUI

struct validatingFormsView: View {
    @State private var username:String = ""
    @State private var email:String = ""
    
    var body: some View {
        return VStack {

            Form {
                Section {
                    TextField("Username", text: $username)
                    TextField("Email", text: $email)
                }
                
                Section {
                    Button("Create account") {
                        print("Creating account...")
                    }
                }
                .disabled(username.isEmpty || email.isEmpty)
            }
        }
    }
}

struct validatingFormsView_Previews: PreviewProvider {
    static var previews: some View {
        validatingFormsView()
    }
}
