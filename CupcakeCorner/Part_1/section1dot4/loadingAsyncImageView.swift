//
//  loadingAsyncImageView.swift
//  CupcakeCorner
//
//  Created by Seika Hirori on 6/1/23.
//

import SwiftUI

struct loadingAsyncImageView: View {
    var body: some View {
        return VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {

                    //                    Text("There was an error loading the image.") // This is example provided by Paul Hudson
                    
                    // Note #1
                    Text("Error: \(phase.error?.localizedDescription ?? "Something went wrong")") // # NOTE #1
                } else {
                    ProgressView()
                }
            }
            .frame(width: 200, height: 200)
        }    }
}

struct loadingAsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        loadingAsyncImageView()
    }
}
