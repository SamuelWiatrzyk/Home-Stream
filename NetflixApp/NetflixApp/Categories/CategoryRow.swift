//
//  CategoryRow.swift
//  NetflixApp
//
//  Created by Samuel Wiatrzyk on 2023-07-25.
//

import SwiftUI
 
struct CategoryRow: View {
    var categoryName: String
    var items: [Equipment]


    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)


            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { equipment in
                        NavigationLink {
                            EquipmentDetail(equipment: equipment)
                        } label: {
                            CategoryItem(equipment: equipment)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}


