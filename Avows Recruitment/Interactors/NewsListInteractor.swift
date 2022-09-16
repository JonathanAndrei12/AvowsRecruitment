//
//  NewsListInteractor.swift
//  Avows Recruitment
//
//  Created by Jonathan Andrei on 12/09/22.
//

import Foundation

class NewsListInteractor {
    
    let networkLayer = NetworkLayer()
    
    func fetchNews(source: String, completionHandler: @escaping (Result<NewsResponse>) -> ()){
        let newsURL = "https://newsapi.org/v2/top-headlines?sources=\(source)&apiKey=5eca70168ebf4f9784adfcc62541bd56"
        
        return networkLayer.request(newsURL, decodeToType: NewsResponse.self, completionHandler: completionHandler)
    }
}
