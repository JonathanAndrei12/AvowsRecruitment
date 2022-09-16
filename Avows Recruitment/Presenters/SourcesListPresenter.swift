//
//  SourcesListPresenter.swift
//  Avows Recruitment
//
//  Created by Jonathan Andrei on 13/09/22.
//

import Foundation
import SwiftUI

class SourcesListPresenter: ObservableObject {
    @Published var sourcesResp: SourcesResponse = SourcesResponse(status: "", code: "", message: "", sources: [Source(id: "", name: "", description: "", url: "", category: "", language: "", country: "")])
    @Published var sourcesFiltered: [Source]?
    @Published var filterText: String = ""
    @Published var isError: Bool = false
    @Published var errMessage: String = ""
    
    private let interactor = SourcesListInteractor()
    private let router = SourcesListRouter()
    
    func fetchSources(category: String) {
        interactor.fetchSources(category: category) { [weak self] res in
            switch res {
            case .success(let sourceResp):
                DispatchQueue.main.async {
                    self?.sourcesResp = sourceResp
                    self?.filterSource()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.isError = true
                    self?.errMessage = error.localizedDescription
                }
            }
        }
    }
    
    func filterSource() {
        if filterText == "" {
            sourcesFiltered = sourcesResp.sources
        } else {
            sourcesFiltered = sourcesResp.sources?.filter({ $0.name?.lowercased().contains(filterText.lowercased()) ?? true })
        }
    }
    
    func newsListBuilder<Content: View>(for source: String, @ViewBuilder content: () -> Content) -> some View {
        NavigationLink(destination: router.makeNewsListView(source: source)) {
            content()
        }
    }
}
