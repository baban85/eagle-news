//
//  API.News.swift
//  EagleNews
//
//  Created by Ba Ban on 8/1/25.
//

import Foundation
import Combine

class NewsAPI: API {
    func fetchArticles(query: String = "tesla") -> AnyPublisher<ArticleListResponse, APIError> {
        guard let url = Endpoint.articles(query: query).url else {
            return Fail(error: APIError.errorURL).eraseToAnyPublisher()
        }
        
        return request(url: url)
            .decode(type: ArticleListResponse.self, decoder: JSONDecoder())
            .mapError { error -> APIError in
                
                switch error {
                case is URLError:
                    return APIError.errorURL
                case is DecodingError:
                    return APIError.errorParsing
                default :
                    return error as? APIError ?? .unknown
                }
            }
            .eraseToAnyPublisher()
    }
    
    func fetchTopTechCrunch(query: String = "tesla") -> AnyPublisher<ArticleListResponse, APIError> {
        guard let url = Endpoint.topTechCrunch.url else {
            return Fail(error: APIError.errorURL).eraseToAnyPublisher()
        }
        
        return request(url: url)
            .decode(type: ArticleListResponse.self, decoder: JSONDecoder())
            .mapError { error -> APIError in
                
                switch error {
                case is URLError:
                    return APIError.errorURL
                case is DecodingError:
                    return APIError.errorParsing
                default :
                    return error as? APIError ?? .unknown
                }
            }
            .eraseToAnyPublisher()
    }
}
