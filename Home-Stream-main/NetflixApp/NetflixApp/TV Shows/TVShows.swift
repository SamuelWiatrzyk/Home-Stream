//
//  TVShows.swift
//  NetflixApp
//
//  Created by Samuel Wiatrzyk on 2023-07-19.
//

import SwiftUI

struct TVShows: View {
    @ObservedObject var users = Users()
    @State var searchingFor = ""

    var body: some View {
        NavigationView {
            List(filteredTV) { user in
                NavigationLink {                    DetailView(users: self.users, user: user)
                } label: {
                    HStack {
                        
                        AsyncImage(url: URL(string: user.address)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 150, height: 200)
                        
                        
                        Text(user.name)
                            .font(.headline)
                        
                    }
                }
            }.navigationTitle("TV Shows").searchable(text: $searchingFor, prompt: Text("Search"))
            
            
        }
    }
    
    var filteredTV: [User] {
        if searchingFor.isEmpty {
            return users.all
        } else {
            
            return users.all.filter {$0.name.localizedCaseInsensitiveContains(searchingFor) } }
        
    }
    
    }
        
