//
//  ArticlesView.swift
//  EagleNews
//
//  Created by Ba Ban on 8/1/25.
//

import SwiftUI

struct ArticlesView: View {
    @ObservedObject var viewModel: ArticlesViewModel
    
    var body: some View {
        NavigationSplitView {
            List(viewModel.articles, id: \.publishedAt) { article in
                NavigationLink {
                    DetailView(article: article)
                } label: {
                    ArticleRow(article: article)
                }
            }
            .onAppear() {
                viewModel.fetchArticles()
            }
            .navigationTitle("Articles")
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
