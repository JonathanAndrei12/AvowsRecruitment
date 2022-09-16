//
//  SourcesResponse.swift
//  Avows Recruitment
//
//  Created by Jonathan Andrei on 13/09/22.
//

/*
 JSON Data
 {"status":"ok","sources":[
 {"id":"bbc-sport",
 "name":"BBC Sport",
 "description":"The home of BBC Sport online. Includes live sports coverage, breaking news, results, video, audio and analysis on Football, F1, Cricket, Rugby Union, Rugby League, Golf, Tennis and all the main world sports, plus major events such as the Olympic Games.",
 "url":"http://www.bbc.co.uk/sport",
 "category":"sports",
 "language":"en",
 "country":"gb"},
*/

import Foundation

struct SourcesResponse: Codable {
    let status: String?
    let code: String?
    let message: String?
    let sources: [Source]?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case code = "code"
        case message = "message"
        case sources = "sources"
    }
    
    init(status: String?, code: String?, message: String?, sources: [Source]?) {
        self.status = status
        self.code = code
        self.message = message
        self.sources = sources
    }
}

struct Source: Codable, Identifiable {
    var id: String?
    var name: String?
    var description: String?
    var url: String?
    var category: String?
    var language: String?
    var country: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case url = "url"
        case category = "category"
        case language = "language"
        case country = "country"
    }
    
    init(id: String?, name: String?, description: String?, url: String?, category: String?, language: String?, country: String?) {
        self.id = id
        self.name = name
        self.description = description
        self.url = url
        self.category = category
        self.language = language
        self.country = country
    }
}
