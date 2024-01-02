//
//  EpisodeDetail.swift
//  NetflixApp
//
//  Created by Samuel Wiatrzyk on 2023-07-23.
//

import SwiftUI
import AVKit

struct EpisodeDetail: View {
    
    @ObservedObject var users: Users
    var friend: Friend
    
    var body: some View {
        
        VStack {

            GeometryReader { geo in
                ZStack {
   
                    if UIDevice.current.orientation.isLandscape {
                        Color.black
                    }
                     
                    VStack {
                        player2(users: users, friend: friend).frame(height: UIDevice.current.orientation.isLandscape ? geo.size.height : geo.size.height)
                       
                         
                             
                             
                    }
                }
            }
             .navigationBarItems(trailing: NavigationLink("Next Episode") {
                 EpisodeDetail(users: users, friend: friend)
          })
            .navigationTitle(friend.name)
            .navigationBarTitleDisplayMode(.inline)
            
            .onAppear() {
                setAudioSessionCategory(to: .playback)
                AVPlayer(url: URL(string: friend.url)!).play()
            }
            .onDisappear {
                
                AVPlayer(url: URL(string: friend.url)!).pause()
            }
        }
       
    }
}




struct player2 : UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        
       let player1 = AVPlayer(url: URL(string: friend.url)!)
       
        // Setting content external metadata
        let titleItem = AVMutableMetadataItem()
        titleItem.identifier = .commonIdentifierTitle
        titleItem.value = String(friend.name) as (any NSCopying & NSObjectProtocol)?
        
        player1.currentItem?.externalMetadata = [titleItem]
        
       let controller = AVPlayerViewController()
       controller.player = player1
       return controller
        
        
    }
    

    
    @ObservedObject var users: Users
    var friend: Friend
    func makeUIViewController(context: UIViewControllerRepresentableContext<player>) -> AVPlayerViewController {
         
        let player1 = AVPlayer(url: URL(string: friend.url)!)
         
        let controller = AVPlayerViewController()
        controller.player = player1
        return controller
    }
     
    func updateUIViewController(_ uiViewController : AVPlayerViewController, context: UIViewControllerRepresentableContext<player>) {
         
         
    }
}
