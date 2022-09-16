//
//  CategoriesListRouter.swift
//  Avows Recruitment
//
//  Created by Jonathan Andrei on 13/09/22.
//

import Foundation
import SwiftUI

class CategoriesListRouter {
    func makeSourcesListView(category: String) -> some View {
        let category = category.lowercased()
        return SourcesListView(categoryChoosed: category)
    }
}
