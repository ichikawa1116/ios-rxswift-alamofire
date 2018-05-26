//
//  TrackModel.swift
//  ios-rxswift-alamofire
//
//  Created by  on 2018/04/14.
//  Copyright © 2018 . All rights reserved.
//

import Foundation

struct TrackModel {
    
    var trackName = ""
    var trackId = ""
    var artistName = ""
    var artworkUrl = ""
    
    init(entity: Track) {
        
        self.trackId = entity.trackId
        self.trackName = entity.trackName
        self.artistName = entity.artistName
        self.artworkUrl = entity.artworkUrl
    }
}


