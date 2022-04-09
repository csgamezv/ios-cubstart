//
//  ArticleEndpoint.swift
//  newsfeedSkeleton
//
//  Created by Cesar Gamez on 4/7/22.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest{ get}
    var baseURL: URL {get}
    var path: String {get}
}

enum ArticleAPI {
    case getNews
}

extension ArticleAPI: APIBuilder {
    var urlRequest: URLRequest {
        switch self {
        case .getNews:
            return URLRequest(url: self.baseURL.appendingPathComponent(self.path))
        }
    }
    
    
    var path: String {
        switch self {
        case .getNews:
            return "/news"
        }
    }
    
    var baseURL: URL {
        
        switch self {
        case .getNews:
            return URL(string: "https://api.lil.software")!
        }
    }
    
    
}
