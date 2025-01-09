//
//  API.swift
//  EagleNews
//
//  Created by Ba Ban on 8/1/25.
//

import Foundation
import Combine

class API {
    
    func request(url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw APIError.invalidResponse
                }
                
                return data
            }
            .eraseToAnyPublisher()
    }
}
