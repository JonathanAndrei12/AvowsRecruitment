//
//  CategoriesListView.swift
//  Avows Recruitment
//
//  Created by Jonathan Andrei on 13/09/22.
//

import SwiftUI

struct CategoriesListView: View {
    @ObservedObject var presenter = CategoriesListPresenter()
    
    var body: some View {
        List(presenter.categoriesArr, id: \.self) { category in
            presenter.sourcesListViewBuilder(for: category) {
                HStack {
                    Text(category)
                        .foregroundColor(Color("TextColor"))
                }
            }
        }
        .navigationTitle("Categories")
    }
}

struct CategoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesListView()
    }
}
