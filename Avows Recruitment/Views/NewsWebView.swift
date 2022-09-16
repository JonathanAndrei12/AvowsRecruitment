//
//  NewsWebView.swift
//  Avows Recruitment
//
//  Created by Jonathan Andrei on 13/09/22.
//

import SwiftUI
import WebKit

enum customURLError {
    case invalidURL
    
    var desc: String {
        switch self {
        case .invalidURL:
            return "Seems like the news is already been taken down, please search for another articles."
        }
    }
}

struct WebView: UIViewRepresentable {
    let url: URL?
    let onError: (customURLError) -> Void
    
    private let webView = WKWebView()
    
    func makeUIView(context: Context) -> some UIView {
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        webView.load(url, onError: onError)
    }
}

extension WKWebView {
    func load(_ url: URL?, onError: (customURLError) -> Void) {
        guard let url = url else {
            return onError(.invalidURL)
        }
        
        self.load(URLRequest(url: url))
    }
}

struct NewsWebView: View {
    let url: String?
    
    var body: some View {
        WebView(url: URL(string: url ?? ""), onError: { error in
            print(error.desc)
        })
            .navigationTitle("Article")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct NewsWebView_Previews: PreviewProvider {
    static var previews: some View {
        NewsWebView(url: "http://www.bbc.co.uk/news/uk-62870783")
    }
}
