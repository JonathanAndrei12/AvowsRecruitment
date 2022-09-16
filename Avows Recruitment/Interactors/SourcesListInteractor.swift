//
//  SourcesListInteractor.swift
//  Avows Recruitment
//
//  Created by Jonathan Andrei on 13/09/22.
//

import Foundation

class SourcesListInteractor {
    let networkLayer = NetworkLayer()
    
    func fetchSources(category: String, completionHandler: @escaping (Result<SourcesResponse>) -> ()) {
        let sourcesURL = "https://newsapi.org/v2/top-headlines/sources?category=\(category)&apiKey=5eca70168ebf4f9784adfcc62541bd56"
        
        print(sourcesURL)
        
        return networkLayer.request(sourcesURL, decodeToType: SourcesResponse.self, completionHandler: completionHandler)
    }
}
