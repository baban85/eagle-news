//
//  DetailView.swift
//  EagleNews
//
//  Created by Ba Ban on 9/1/25.
//

import SwiftUI

struct DetailView: View {
    var article: Article
    
    var body: some View {
        ScrollView {
            
            if let imageUrl = article.urlToImage {
                AsyncImage(url: URL(string: imageUrl)){ result in
                    result.image?
                        .resizable()
                        .scaledToFill()
                }
            }
            
            HStack {
                Text(article.source.name)
                Spacer()
                Text(article.publishedAt.prefix(10))
            }
            .foregroundStyle(.secondary)
            .padding()
            
            Text(article.title)
                .font(.headline)
                .padding()
            Text(article.description ?? "No description")
                .font(.headline)
                .padding()
            Text(article.content).padding().font(.body)
        }
        .navigationTitle(article.author ?? "No Author")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView(article: MockData().articles[0])
}
