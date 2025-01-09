//
//  ArticleUseCase.swift
//  EagleNews
//
//  Created by Ba Ban on 8/1/25.
//

import Foundation
import Combine

protocol ArticleUseCase {
    func executeArticles(query: String) -> AnyPublisher<ArticleListResponse, APIError>
    func executeTopTechCrunch() -> AnyPublisher<ArticleListResponse, APIError>
}

class ArticleUseCaseImpl: ArticleUseCase {
    
    private let repository: ArticleRepository
    
    init(repository: ArticleRepository) {
        self.repository = repository
    }
    
    func executeArticles(query: String) -> AnyPublisher<ArticleListResponse, APIError> {
        return repository.fetchArticles(query: query)
    }
    
    func executeTopTechCrunch() -> AnyPublisher<ArticleListResponse, APIError> {
        return repository.fetchTopTechCrunch()
    }
}
