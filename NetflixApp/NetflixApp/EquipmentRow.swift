//
//  EquipmentRow.swift
//  NetflixApp
//
//  Created by Samuel Wiatrzyk on 2023-07-19.
//

import SwiftUI
import AVKit

struct EquipmentRow: View {
    var equipment: Equipment
    @AppStorage("showFavorites") private var showFavoritesOnly = false
    
    var body: some View {
        HStack {
            
            AsyncImage(url: URL(string: equipment.imageName)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 150, height: 200)

            Spacer()
            VStack {
                

                Spacer()
                Spacer()
                Text(equipment.name + " (\(equipment.year))").font(.headline).padding()
                Spacer()
                Text("Directed By: \(equipment.director)").font(.subheadline)
                
            }
            
            Spacer()
            
            if equipment.isFavorite {
                
                Image(systemName: "star.fill").foregroundColor(.yellow)
                
            }
            
            
           
        }
    }
}

