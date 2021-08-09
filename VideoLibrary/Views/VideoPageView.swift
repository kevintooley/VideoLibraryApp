//
//  VideoPageView.swift
//  VideoLibrary
//
//  Created by Kevin Tooley on 8/8/21.
//

import SwiftUI
import AVKit

struct VideoPageView: View {
    
    @EnvironmentObject var model: VideoModel
    var videoIndex: Int
    
    // sample.mp4 is 1920 x 1080
    let videoRatio: CGFloat = 1080 / 1920
    
    var body: some View {
        
        let url = URL(string: model.videos[videoIndex].url)
            
        GeometryReader { geo in
            
            VStack {
                
                Text(model.videos[videoIndex].title)
                    .font(.title)
                    .bold()
                    .padding()
                
                VideoPlayer(player: AVPlayer(url: url!))
                    .frame(height: geo.size.width * videoRatio)
                
            }
            
        }
        
    }
    
}


