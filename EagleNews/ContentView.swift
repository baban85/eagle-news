//
//  ContentView.swift
//  EagleNews
//
//  Created by Ba Ban on 7/1/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        TabView {
            articleView()
            topTechCrunchView()
            
            BlankView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
            
            BlankView()
                .tabItem {
                    Label("Fun Facts", systemImage: "hand.thumbsup")
                }
        }
        
    }
    
    func articleView() -> some View {
        //let newsAPI = NewsAPI()
        //let repository = ArticleRepositoryImpl(newsApi: newsAPI)
        
        // Mock data: loaded from json file
        let repository = ArticleRepositoryMock()
        let useCase = ArticleUseCaseImpl(repository: repository)
        let viewModel = ArticlesViewModel(useCase: useCase)
        
        return ArticlesView(viewModel: viewModel)
            .tabItem {
                Label("Home", systemImage: "newspaper")
            }
    }
    
    func topTechCrunchView() -> some View {
        //let newsAPI = NewsAPI()
        //let repository = ArticleRepositoryImpl(newsApi: newsAPI)
        
        // Mock data: loaded from json file
        let repository = ArticleRepositoryMock()
        let useCase = ArticleUseCaseImpl(repository: repository)
        let viewModel = TopTechCrunchViewModel(useCase: useCase)
        
        return TopTechCrunchView(viewModel: viewModel)
            .tabItem {
                Label("Top", systemImage: "book")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
