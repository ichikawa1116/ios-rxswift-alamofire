//
//  File.swift
//  ios-rxswift-alamofire
//
//  Created by  on 2018/03/25.
//  Copyright © 2018 . All rights reserved.
//

import Foundation
import ObjectMapper

struct Results: Mappable {
    var resultCount = 0
    var results: [Track]?
    
    init?(map: Map){}
    
    mutating func mapping(map: Map) {
        resultCount <- map["resultCount"]
        results     <- map["results"]
    }
}

struct Track: Mappable {
    var trackName = ""
    var trackId = ""
    var artistName = ""
    var artworkUrl = ""
    
    init?(map: Map){}
    
    mutating func mapping(map: Map) {
        trackId     <- map["trackId"]
        trackName   <- map["trackName"]
        artistName  <- map["artistName"]
        artworkUrl  <- map["artworkUrl100"]
    }
}

