//
//  ArticleRepositoryMock.swift
//  EagleNews
//
//  Created by Ba Ban on 8/1/25.
//

import Foundation
import Combine

class ArticleRepositoryMock : ArticleRepository {
    
    func fetchArticles(query: String) -> AnyPublisher<ArticleListResponse, APIError> {
        Future { promise in
            DispatchQueue.global(qos: .background).async {
                guard let url = Bundle.main.url(forResource: "articles", withExtension: "json") else {
                    return promise(.failure(APIError.unknown))
                }
                
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(ArticleListResponse.self, from: data)
                    DispatchQueue.main.async {
                        promise(.success(response))
                    }
                } catch {
                    print(error)
                    
                    DispatchQueue.main.async {
                        promise(.failure(APIError.unknown))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func fetchTopTechCrunch() -> AnyPublisher<ArticleListResponse, APIError> {
        Future { promise in
            DispatchQueue.global(qos: .background).async {
                guard let url = Bundle.main.url(forResource: "toptechcrunch", withExtension: "json") else {
                    return promise(.failure(APIError.unknown))
                }
                
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(ArticleListResponse.self, from: data)
                    DispatchQueue.main.async {
                        promise(.success(response))
                    }
                } catch {
                    print(error)
                    
                    DispatchQueue.main.async {
                        promise(.failure(APIError.unknown))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
