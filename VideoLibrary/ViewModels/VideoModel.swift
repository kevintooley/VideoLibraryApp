//
//  VideoModel.swift
//  VideoLibrary
//
//  Created by Kevin Tooley on 8/8/21.
//

import Foundation

class VideoModel: ObservableObject {
    
    @Published var videos = [Video]()
    
    init() {
        
        getRemoteData()
        
    }
    
    getRemoteData() {
        
        // set string
        let urlString = "https://codewithchris.github.io/Module5Challenge/Data.json"
        
        // set url
        let url = URL(string: urlString)
        
        // guard url
        guard url != nil else {
            return
        }
        
        // create request
        let request = URLRequest(url: url!)
        
        // create session
        let session = URLSession.shared
        
        // create dataTask
        let dataTask = session.dataTask(with: request) { data, response, error in
            
            // guard error
            guard error == nil else {
                return
            }
            
            // create decoder
            let decoder = JSONDecoder()
            
            do {

                // decode
                let modules = try decoder.decode([Video].self, from: data!)
                
                // dispatchQueue main
                DispatchQueue.main.async {
                    
                    // append to videoModel
                    self.videos += modules
                    
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
