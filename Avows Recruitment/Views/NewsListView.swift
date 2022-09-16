//
//  NewsListView.swift
//  Avows Recruitment
//
//  Created by Jonathan Andrei on 12/09/22.
//

import SwiftUI

struct NewsListView: View {
    let sourceChoosed: String
    @ObservedObject var presenter = NewsListPresenter()
    
    var body: some View {
        VStack {
            SearchBar(searchText: $presenter.filterText)
            if (presenter.newsResp.status != nil && presenter.newsResp.status! == "ok") {
                ScrollView {
                    VStack {
                            ForEach(presenter.newsFiltered!, id: \.id) { art in
                                self.presenter.webViewBuilder(for: art.url ?? "") {
                                    ArticlesCard(article: art)
                                }
                            }
                        
                    }
                }
            } else {
                Text(presenter.newsResp.message ?? "Something is missing.")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/1.5, alignment: .center)
            }
        }
        .onAppear {
            presenter.fetchNews(source: sourceChoosed)
        }
        .onChange(of: presenter.filterText, perform: { val in
            presenter.filterNews()
        })
        .navigationTitle("News List")
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView(sourceChoosed: "bbc-news")
    }
}
