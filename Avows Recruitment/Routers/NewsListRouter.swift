//
//  NewsListRouter.swift
//  Avows Recruitment
//
//  Created by Jonathan Andrei on 12/09/22.
//

import Foundation
import SwiftUI
import WebKit

class NewsListRouter {
    func makeWebView(for url: String?) -> some View {
        return NewsWebView(url: url ?? "")
    }
}
