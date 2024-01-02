//
//  SynopsisView.swift
//  NetflixApp
//
//  Created by Samuel Wiatrzyk on 2023-07-23.
//

import SwiftUI

struct SynopsisView: View {
    @AppStorage("showFavorites") private var showFavoritesOnly = false
    @Binding var isSet: Bool
    var equipment : Equipment
    var body: some View {
        ScrollView {
            HStack {
                // Text referring to the movie's name.
                Text(equipment.name)
                    .padding(20)
                
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 50))
                // A button that toggles between the state of the view. (Basically toggles off upon clicking)
                Button {
                    isSet.toggle() } label: {
                        Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star").padding().labelStyle(.iconOnly).foregroundColor(isSet ? .yellow: .gray).font(.system(size: 35))
                    }
                
                
            }
            // Displays the 'year' piece of meta data from the JSON array.
            Text("(\(equipment.year))")
                .padding()

                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 30))
            
            Divider().foregroundColor(.white)
            // The image that is pulled from the webserver using JSON to call the string.
            AsyncImage(url: URL(string: equipment.imageName)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 400, height: 500)
            
            // Director information from the JSON array
            HStack {
                Text("Directed By:")
                    .padding()
                
                Text(equipment.director)
                
               

              
            }                   .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider().foregroundColor(.white)
            
            
            Text("Synopsis:")
                .padding()
                .font(.headline)
            // Synopsis info that is pulled from the equipmentData JSON array.
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(equipment.synopsis)
                
                .padding()
                .font(.subheadline)

                .frame(maxWidth: .infinity, alignment: .leading)
            


 
        }
    }
}

