//
//  News.swift
//  Avows Recruitment
//
//  Created by Jonathan Andrei on 12/09/22.
//

/*
 JSON Data
 {"status":"ok","totalResults":38,"articles":[{"source":{"id":null,"name":"Detik.com"},"author":"Faizal Amiruddin","title":"Dinkes Tasik Masih Tunggu Hasil Lab Pasien Dicurigai Cacar Monyet - detikcom","description":"Dinas Kesehatan Kota Tasikmalaya masih menunggu hasil pemeriksaan laboratorium terkait pasien di RSUD dr Soekardjo yang memiliki gejala mirip cacar monyet.","url":"https://www.detik.com/jabar/berita/d-6287471/dinkes-tasik-masih-tunggu-hasil-lab-pasien-dicurigai-cacar-monyet","urlToImage":"https://awsimages.detik.net.id/api/wm/2022/08/24/ilustrasi-penyakit-cacar-monyet_169.jpeg?wid=54&w=650&v=1&t=jpeg","publishedAt":"2022-09-12T10:21:30Z","content":"Tasikmalaya - Dinas Kesehatan Kota Tasikmalaya masih menunggu hasil pemeriksaan laboratorium terkait pasien di RSUD dr Soekardjo yang memiliki gejala mirip cacar monyet alias monkey pox.\r\n\"Belum masi… [+1864 chars]"},
*/

import Foundation

struct NewsResponse: Codable {
    let status: String?
    let code: String?
    let message: String?
    let totalResult: Int?
    let articles: [Article]?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case code = "code"
        case message = "message"
        case totalResult = "totalResult"
        case articles = "articles"
    }
    
    init(status: String?, code: String?, message: String?, totalResult: Int?, articles: [Article]?) {
        self.status = status
        self.code = code
        self.message = message
        self.totalResult = totalResult
        self.articles = articles
    }
}

struct Article: Codable, Identifiable {
    var id: UUID = UUID()
    let source: NewsSource?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    enum CodingKeys: String, CodingKey {
        case source = "source"
        case author = "author"
        case title = "title"
        case description = "description"
        case url = "url"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case content = "content"
    }
    
    init(source: NewsSource?, author: String?, title: String?, description: String?, url: String?, urlToImage: String?, publishedAt: String?, content: String?) {
        self.source = source
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
}

struct NewsSource: Codable {
    let id: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    init(id: String?, name: String?) {
        self.id = id
        self.name = name
    }
}
