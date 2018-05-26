//
//  TrackRepository.swift
//  ios-rxswift-alamofire
//
//  Created by  on 2018/04/14.
//  Copyright © 2018 . All rights reserved.
//

import Foundation
import RxSwift

protocol TrackRepository {
   func fecthList(artist: String) -> Observable<Results>
}

class TrackRepositoryImpl: TrackRepository{
    
    private let dataSource = TrackDataStore()
    
    func fecthList(artist: String) -> Observable<Results>{
        return dataSource.fetch(artist: artist)
    }
}
