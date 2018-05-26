//
//  TrackUseCase.swift
//  ios-rxswift-alamofire
//
//  Created by  on 2018/04/14.
//  Copyright © 2018 . All rights reserved.
//

import Foundation
import RxSwift

class TrackUseCase {
    
    private let repository: TrackRepository
   
    init(repository: TrackRepository) {
        self.repository = repository
    }
    
    func getTrackList(artist: String) -> Observable<TrackListModel> {
        return repository.fecthList(artist: artist)
            .map(translator:TrackTranslator())
    }
}
