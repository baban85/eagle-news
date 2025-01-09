//
//  APIError.swift
//  EagleNews
//
//  Created by Ba Ban on 8/1/25.
//

import Foundation

struct Config {
    static let baseURL = "https://newsapi.org/v2"
    static let apiKey = "8cef49bf00204a1684c6c95cb00c136b"
}

enum APIError: Error {
    case error(String)
    case errorURL
    case invalidResponse
    case errorParsing
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .error(let description):
            return description
        case .errorURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid response"
        case .errorParsing:
            return "Error parsing response"
        case .unknown:
            return "Unknown error"
        }
    }
}

enum Endpoint {
    case articles(query: String)
    case topTechCrunch
    
    var url: URL? {
        switch self {
        case .articles(let query):
            let urlString = Config.baseURL + "/everything?q=\(query)&from=2024-12-07&sortBy=publishedAt&apiKey=\(Config.apiKey)"
            return URL(string: urlString)
        case .topTechCrunch:
            let urlString = Config.baseURL + "/top-headlines?sources=techcrunch&apiKey=\(Config.apiKey)"
            return URL(string: urlString)
        }
    }
}
