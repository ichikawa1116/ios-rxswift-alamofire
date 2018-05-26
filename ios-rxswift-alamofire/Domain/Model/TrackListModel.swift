//
//  TrackListModel.swift
//  ios-rxswift-alamofire
//
//  Created by  on 2018/04/14.
//  Copyright © 2018 . All rights reserved.
//

import Foundation

struct TrackListModel {
    var resultCount = 0
    var list: [TrackModel]?
    
    init (entity: Results){
        self.resultCount = entity.resultCount
        if let results = entity.results{
            self.list = results.map{(track: Track) -> TrackModel in
                return TrackModel(entity: track)
            }
        }
    }
}
