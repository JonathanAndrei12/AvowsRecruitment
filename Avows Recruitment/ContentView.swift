//
//  ContentView.swift
//  Avows Recruitment
//
//  Created by Jonathan Andrei on 12/09/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            CategoriesListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
