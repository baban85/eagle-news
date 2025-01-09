//
//  TopTechCrunchViewModel.swift
//  EagleNews
//
//  Created by Ba Ban on 8/1/25.
//

import Foundation
import Combine

class TopTechCrunchViewModel: ObservableObject {
    private let useCase: ArticleUseCase
    private var cancellables = Set<AnyCancellable>()
    
    @Published var articles: [Article] = []
    @Published var totalResults: Int = 0
    
    init(useCase: ArticleUseCase) {
        self.useCase = useCase
    }
    
    func fetchTopTechCrunch() {
        useCase.executeTopTechCrunch()
               .sink(receiveCompletion: { completion in
                   // Handle errors if needed
               }, receiveValue: { response in
                   self.articles = response.articles
                   self.totalResults = response.totalResults
               })
               .store(in: &cancellables)
    }
}