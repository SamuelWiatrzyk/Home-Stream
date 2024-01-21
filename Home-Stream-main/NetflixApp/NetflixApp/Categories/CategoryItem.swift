//
//  CategoryItem.swift
//  NetflixApp
//
//  Created by Samuel Wiatrzyk on 2023-07-25.
//

import SwiftUI

struct CategoryItem: View {
    var equipment: Equipment
    @AppStorage("ipAddress") private var ipAddress = ""
    @AppStorage("port") private var port = ""

    var body: some View {
        VStack(alignment: .leading) {
            
            AsyncImage(url: URL(string:  ipAddress + ":" + port + "/" + equipment.imageName)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 150)
            
            Text(equipment.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}


struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(equipment: ModelData().equipment[0])
    }
}
