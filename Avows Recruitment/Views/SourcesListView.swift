//
//  SourcesListView.swift
//  Avows Recruitment
//
//  Created by Jonathan Andrei on 13/09/22.
//

import SwiftUI

struct SourcesListView: View {
    let categoryChoosed: String
    
    @ObservedObject var presenter = SourcesListPresenter()
    
    var body: some View {
        VStack {
            SearchBar(searchText: $presenter.filterText)
            if (presenter.sourcesResp.status != nil && presenter.sourcesResp.status! == "ok") {
                List(presenter.sourcesFiltered!, id: \.id) { source in
                    self.presenter.newsListBuilder(for: source.id ?? "") {
                        Text(source.name ?? "No Name")
                            .foregroundColor(Color("TextColor"))
                    }
                }
            } else {
                Text(presenter.sourcesResp.message ?? "Something is missing.")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/1.5, alignment: .center)
            }
        }
        .navigationTitle("Sources")
        .onAppear {
            presenter.fetchSources(category: categoryChoosed)
        }
        .onChange(of: presenter.filterText) { val in
            presenter.filterSource()
        }
    }
}

struct SourcesListView_Previews: PreviewProvider {
    static var previews: some View {
        SourcesListView(categoryChoosed: "technology")
    }
}
