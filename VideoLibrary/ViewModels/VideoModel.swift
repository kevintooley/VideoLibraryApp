//
//  VideoModel.swift
//  VideoLibrary
//
//  Created by Kevin Tooley on 8/8/21.
//

import Foundation

class VideoModel: ObservableObject {
    
    @Published var videos = [Video]()
    var allVideos = [Video]()
    
    init() {
        
        getRemoteData()
        //self.getData()
        
    }
    
    func getData() {
        
        guard let url = URL(string: "https://kevintooley.github.io/learning_pages/Data.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let data = data, let videos = try? JSONDecoder().decode([Video].self, from: data) {

                self.allVideos = videos

                DispatchQueue.main.async {
                    self.videos = videos
                }

            }
        }
        .resume()
        
    }
    
    func getRemoteData() {
        
        // set string
        //let urlString = "https://codewithchris.github.io/Module5Challenge/Data.json"
        let urlString = "https://kevintooley.github.io/learning_pages/Data.json"
        
        // set url
        let remoteUrl = URL(string: urlString)
        
        // guard url
        guard remoteUrl != nil else {
            return
        }
        
        // create request
        let request = URLRequest(url: remoteUrl!)
        
        // create session
        let session = URLSession.shared
        
        // create dataTask
        let dataTask = session.dataTask(with: request) { data, response, error in
            
            // guard error
            guard error == nil else {
                return
            }
            
            do {
                
                // create decoder
                let decoder = JSONDecoder()

                // decode
                let videos = try decoder.decode([Video].self, from: data!)
                
                // dispatchQueue main
                DispatchQueue.main.async {
                    
                    // append to videoModel
                    self.videos += videos
                    
                }
            }
            catch {
                print(error)
            }

        }

        // resume
        dataTask.resume()
        
    }
    
}
