//
//  NewsListPresenter.swift
//  Avows Recruitment
//
//  Created by Jonathan Andrei on 12/09/22.
//

import Foundation
import SwiftUI

class NewsListPresenter: ObservableObject {
    @Published var newsResp: NewsResponse = NewsResponse(status: "", code: "", message: "", totalResult: 0, articles: [Article(source: NewsSource(id: "", name: ""), author: "", title: "", description: "", url: "", urlToImage: "", publishedAt: "", content: "")])
    @Published var newsFiltered: [Article]?
    @Published var filterText: String = ""
    @Published var isError: Bool = false
    @Published var errMessage: String = ""
    
    private let interactor = NewsListInteractor()
    private let router = NewsListRouter()
    
    func fetchNews(source: String) {
        interactor.fetchNews(source: source) { [weak self] res in
            switch res {
            case .success(let newsResp):
                DispatchQueue.main.async {
                    self?.newsResp = newsResp
                    self?.filterNews()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.isError = true
                    self?.errMessage = error.localizedDescription
                }
            }
        }
    }
    
    func filterNews() {
        if filterText == "" {
            newsFiltered = newsResp.articles
        } else {
            newsFiltered = newsResp.articles?.filter({ $0.title?.lowercased().contains(filterText.lowercased()) ?? true || $0.description?.lowercased().contains(filterText.lowercased()) ?? true})
        }
    }
    
    func webViewBuilder<Content: View>(for url: String, @ViewBuilder content: () -> Content
    ) -> some View {
      NavigationLink(destination: router.makeWebView(for: url)) {
        content()
      }
    }
}
