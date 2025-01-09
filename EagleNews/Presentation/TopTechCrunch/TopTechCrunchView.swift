//
//  TopTechCrunchView.swift
//  EagleNews
//
//  Created by Ba Ban on 8/1/25.
//

import SwiftUI

struct TopTechCrunchView: View {
    @ObservedObject var viewModel: TopTechCrunchViewModel
    
    var body: some View {
        NavigationSplitView {
            List(viewModel.articles, id: \.publishedAt) { article in
                NavigationLink {
                    DetailView(article: article)
                } label: {
                    Text(article.title)
                }
            }
            .onAppear() {
                viewModel.fetchTopTechCrunch()
            }
            .navigationTitle("Top Tech Crunch")
        } detail: {
            Text("Select an article")
        }
    }
}

#Preview {
    // Mock data: loaded from json file
    let repository = ArticleRepositoryMock()
    
    let useCase = ArticleUseCaseImpl(repository: repository)
    let viewModel = ArticlesViewModel(useCase: useCase)
    
    ArticlesView(viewModel: viewModel)
}
