//
//  HomeView.swift
//  VideoLibrary
//
//  Created by Kevin Tooley on 8/8/21.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: VideoModel
    
    var body: some View {
        
        NavigationView {
            
            List {

                ForEach (0..<model.videos.count, id: \.self) { index in
                    
                    NavigationLink(
                        destination: VideoPageView(videoIndex: index),
                        label: {
                            Text(model.videos[index].title)
                                .accentColor(.black)
                        })
                    
                }
                
            }.navigationBarTitle(Text("All Videos"))
            
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(VideoModel())
    }
}
