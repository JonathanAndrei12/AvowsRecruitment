//
//  ArticlesCard.swift
//  Avows Recruitment
//
//  Created by Jonathan Andrei on 12/09/22.
//

import SwiftUI

struct ArticlesCard: View {
    let article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(url: URL(string: article.urlToImage ?? "")!, placeholder: {ProgressView()}, image: { image in
                    Image(uiImage: image)
                        .resizable()
                })
                .frame(width: 100, height: 100, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                VStack(alignment: .leading) {
                    Text(article.title ?? "No Title")
                        .foregroundColor(Color("TextColor"))
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 5)
                    
                    Text(article.description ?? "No Description")
                        .foregroundColor(Color("TextColor"))
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                        .truncationMode(.tail)
                }
            }
            
            HStack(alignment: .bottom) {
                HStack {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 10, height: 10, alignment: .center)
                        .foregroundColor(Color("CaptionColor"))
                    
                    Text(article.author ?? "Anonymous")
                        .font(.caption2)
                        .foregroundColor(Color("CaptionColor"))
                }
                
                Spacer()
                
                Text(article.publishedAt?.prefix(10) ?? "-")
                    .font(.caption2)
                    .foregroundColor(Color("CaptionColor"))
            }
            
            Divider()
        }
        .padding(.horizontal)
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
    }
}

struct ArticlesCard_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesCard(article: Article(source: NewsSource(id: "bbc-news", name: "BBC News"), author: "BBC News", title: "Prince Andrew to care for Queen\'s beloved corgis", description: "The Queen\'s second son and his ex-wife Sarah, Duchess of York will now look after her iconic dogs.", url: "http://www.bbc.co.uk/news/uk-62870783", urlToImage: "https://ichef.bbci.co.uk/news/1024/branded_news/11E29/production/_126675237_c82a2e583aead6f8579fd2636408097a6da8e599.jpg", publishedAt: "2022-09-11T17:52:21.1786628Z", content: "Queen Elizabeth II\'s corgis are going to live with her son Prince Andrew and his ex-wife, the BBC has confirmed.\r\nThe Duke of York and Sarah, Duchess of York will take on Muick and Sandy - two young … [+2711 chars]"))
    }
}
