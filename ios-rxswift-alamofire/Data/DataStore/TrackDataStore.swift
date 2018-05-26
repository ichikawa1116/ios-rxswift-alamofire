//
//  TrackDataSource.swift
//  ios-rxswift-alamofire
//
//  Created by  on 2018/04/14.
//  Copyright © 2018 . All rights reserved.
//

import Foundation
import RxSwift

class TrackDataStore {
    fileprivate let api = ArtistSearchAPI()
    
    func fetch(artist :String) -> Observable<Results> {
        return api.fetch(artist: artist)
    }
}
