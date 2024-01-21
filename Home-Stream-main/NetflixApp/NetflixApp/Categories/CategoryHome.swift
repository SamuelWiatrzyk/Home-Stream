//
//  CategoryHome.swift
//  NetflixApp
//
//  Created by Samuel Wiatrzyk on 2023-07-25.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData

    @AppStorage("genreView") var genreView: Bool = false
    var body: some View {
        NavigationView {
            List {
                
                
                Image("TheWolfOfWallStreet")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }.listRowInsets(EdgeInsets())
            }.navigationBarItems(trailing:      HStack {
                
                Toggle(isOn: $genreView) {
                    HStack {
                        Text("List View")
                    }
                }

                
                
            }.padding())
            .navigationTitle("Genres")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome().environmentObject(ModelData())
    }
}
