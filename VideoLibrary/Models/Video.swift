//
//  Video.swift
//  VideoLibrary
//
//  Created by Kevin Tooley on 8/8/21.
//

import Foundation

struct Video: Decodable, Identifiable {
    
    var id: Int
    var title: String
    var url: String
    
}
