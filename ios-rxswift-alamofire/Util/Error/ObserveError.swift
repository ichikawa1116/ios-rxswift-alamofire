//
//  Error.swift
//  ios-rxswift-alamofire
//
//  Created by  on 2018/04/15.
//  Copyright © 2018 . All rights reserved.
//

import Foundation

enum Type {
    case noConnection
    case noAuthority
}

struct ObserveError:Error {
    let title: String
    let message: String
    let type: Type
    
    init(title: String, message: String, type: Type) {
        self.title = title
        self.message = message
        self.type = type
    }
}
