//
//  NetworkManager.swift
//  ios-rxswift-alamofire
//
//  Created by  on 2018/04/18.
//  Copyright © 2018 . All rights reserved.
//


import Foundation
import Reachability

final class NetworkManager {
    
    static func isNetworkConnected() ->Bool{
        if let reachability = Reachability() {
            if reachability.connection == .none {
                return false
            }
            return true
        }
        return false
    }
    
}

