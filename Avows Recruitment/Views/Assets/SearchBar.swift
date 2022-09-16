//
//  SearchBar.swift
//  Avows Recruitment
//
//  Created by Jonathan Andrei on 15/09/22.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            TextField("Type here to search.", text: $searchText)
                .frame(minWidth: 0, maxWidth: .infinity)
                .textInputAutocapitalization(.never)
            
            if !searchText.isEmpty {
                Button(action: {
                    searchText = ""
                }) {
                    Text("Clear")
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""))
    }
}
