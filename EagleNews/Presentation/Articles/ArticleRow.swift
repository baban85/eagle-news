//
//  ArticleRow.swift
//  EagleNews
//
//  Created by Ba Ban on 9/1/25.
//

import SwiftUI

struct ArticleRow: View {
    var article: Article
    
    var body: some View {
        HStack {
            if let imageUrl = article.urlToImage {
                AsyncImage(url: URL(string: imageUrl)){ result in
                    result.image?
                        .resizable()
                        .scaledToFill()
                }
                .frame(width: 64, height: 64)
                .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Text(article.title).lineLimit(2)
                HStack {
                    Text(article.source.name)
                }.foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    ArticleRow(article: MockData().articles[0])
}
