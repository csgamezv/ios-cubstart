//
//  FeedView.swift
//  newsfeedSkeleton
//
//  Created by Cesar Gamez on 4/8/22.
//

import Combine
import SwiftUI

struct FeedView: View {
    @Environment(\.openURL) var openURL
    @StateObject var viewModel: ArticleViewModelImpl =  ArticleViewModelImpl(service: ArticleServiceImpl())
    
    
    var body: some View {
        
        NavigationView {
            
            Group {
                switch viewModel.state {
                case .loading:
                    ProgressView()
                case .failed(let error):
                    ErrorView(error:error) {
                        self.viewModel.getArticle()
                    }
                case .success(let content):
                    List(content) { article in
                        ArticleView(article: article)
                            .onTapGesture {
                                load(url: article.url)
                            }
                    }
                    .navigationBarTitle("News")
                }
            }
        }
        .onAppear {
            print("FeedView has appeared")
            self.viewModel.getArticle()
        }
    }
    func load(url:String?) {
        guard let url = url,
              let linkURL = URL(string: url) else {
            return
        }
        openURL(linkURL)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
