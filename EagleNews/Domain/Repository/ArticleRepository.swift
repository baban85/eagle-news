//
//  ArticleRepository.swift
//  EagleNews
//
//  Created by Ba Ban on 8/1/25.
//

import Foundation
import Combine

protocol ArticleRepository {
    func fetchArticles(query: String) -> AnyPublisher<ArticleListResponse, APIError>
    func fetchTopTechCrunch() -> AnyPublisher<ArticleListResponse, APIError>
}

class ArticleRepositoryImpl : ArticleRepository {
    
    private let newsApi : NewsAPI
    
    init(newsApi: NewsAPI) {
        self.newsApi = newsApi
    }
    
    func fetchArticles(query: String) -> AnyPublisher<ArticleListResponse, APIError> {
        return newsApi.fetchArticles(query: query)
    }
    
    func fetchTopTechCrunch() -> AnyPublisher<ArticleListResponse, APIError> {
        return newsApi.fetchTopTechCrunch()
    }
}
