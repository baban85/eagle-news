//
//  Article.swift
//  EagleNews
//
//  Created by Ba Ban on 8/1/25.
//

struct Article: Decodable {
    let source: ArticleSource
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String
}

struct ArticleSource: Decodable {
    let id: String?
    let name: String
}

struct ArticleListResponse: Decodable {
    var status: String
    var totalResults: Int
    var articles: [Article]
}
