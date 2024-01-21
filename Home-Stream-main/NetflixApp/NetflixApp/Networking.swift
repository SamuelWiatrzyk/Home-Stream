//
//  Networking.swift
//  NetflixApp
//
//  Created by Samuel Wiatrzyk on 2024-01-20.
//

import SwiftUI

struct Networking: View {
    
    @AppStorage("ipAddress") private var ipAddress = ""
    @AppStorage("port") private var port = ""
    
    var body: some View {
    
        NavigationView{
            VStack{
                List {
                    // Section 1
                    Section("Networking") {
                        
                        
                        HStack {
                            
                Text("IP Address: ")
                        TextField("Ip Address / URL", text: $ipAddress)
                            
                    }
                        
                        HStack {
                            
                Text("Port: ")
                            TextField("eg. 8888", text: $port).keyboardType(.decimalPad)
                            
                    }
                       
                    }
                    
                  
                    
                    
              
                    
                    
              
                
                
                .navigationTitle("Settings")
            }
            
            
        }
        
    }
        
        
    }
    
}

#Preview {
    Networking()
}
