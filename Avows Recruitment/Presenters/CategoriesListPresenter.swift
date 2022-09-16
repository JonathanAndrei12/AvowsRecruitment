//
//  CategoriesListPresenter.swift
//  Avows Recruitment
//
//  Created by Jonathan Andrei on 13/09/22.
//

import Foundation
import SwiftUI

class CategoriesListPresenter: ObservableObject {
    @Published var categoriesArr = ["Business", "Entertainment", "General", "Health", "Science", "Sports", "Technology"]
    
    private let router = CategoriesListRouter()
    
    func sourcesListViewBuilder<Content: View>(for category: String, @ViewBuilder content: () -> Content) -> some View {
        NavigationLink(destination: router.makeSourcesListView(category: category)) {
            content()
        }

    }
}
