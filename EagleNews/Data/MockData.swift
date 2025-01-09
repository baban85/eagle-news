//
//  MockData.swift
//  EagleNews
//
//  Created by Ba Ban on 9/1/25.
//

import Foundation

@Observable
class MockData {
    var articles: [Article] = loadTopTechCrunch()
}

func loadTopTechCrunch() -> [Article] {
    let response = load("toptechcrunch.json") as ArticleListResponse
    return response.articles
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename)")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename): \(error)")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Couldn't decode \(filename): \(error)")
    }
}
