//
//  SearchBar.swift
//  VideoLibrary
//
//  Created by Kevin Tooley on 8/8/21.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    
    @Binding var text : String
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.delegate = context.coordinator
        searchBar.layer.borderColor = UIColor.systemBackground.cgColor
        searchBar.layer.borderWidth = 1
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Cordinator {
        return Cordinator(self)
    }
    
    class Cordinator: NSObject, UISearchBarDelegate {
        var parent: SearchBar
        
        init(_ parent: SearchBar) {
            self.parent = parent
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            parent.text = searchText
        }
    }
    
}

