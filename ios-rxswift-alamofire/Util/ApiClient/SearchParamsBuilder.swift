//
//  SearchParamsBuilder.swift
//  ios-rxswift-alamofire
//
//  Created by  on 2018/03/25.
//  Copyright © 2018 . All rights reserved.
//

import Foundation

final class RestSearchParamsBuilder {
    
    static func create(artist: String) -> [String: Any] {
        let params = [
            "term": artist,
        ]
        return params
    }
}
