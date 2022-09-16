//
//  SourcesListRouter.swift
//  Avows Recruitment
//
//  Created by Jonathan Andrei on 14/09/22.
//

import Foundation
import SwiftUI

class SourcesListRouter {
    func makeNewsListView(source: String) -> some View {
        return NewsListView(sourceChoosed: source)
    }
}
