//
//  Router.swift
//  ios-rxswift-alamofire
//
//  Created by  on 2018/03/25.
//  Copyright © 2018 . All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    static let baseURLString = "https://itunes.apple.com/search"
    case trackSearch([String: Any])
    
    /// URLリクエストを作成する
    ///
    /// - Returns: URLリクエスト
    func asURLRequest() throws -> URLRequest {
        let (method, parameters): (HTTPMethod, [String: Any]) = {
            
            switch self {
            case .trackSearch(let params):
                return (.get, params)
            }
        }()
        
        let url = URL(string: Router.baseURLString)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = method.rawValue
        return try Alamofire.URLEncoding.default.encode(urlRequest, with: parameters)
    }
    
    
}
