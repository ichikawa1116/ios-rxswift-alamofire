//
//  TrackTranslator.swift
//  ios-rxswift-alamofire
//
//  Created by  on 2018/04/17.
//  Copyright © 2018 . All rights reserved.
//

import Foundation
import RxSwift

struct TrackTranslator: Translator {
    typealias Input = Results
    typealias Output = TrackListModel
    
    func translate(_ entity: Results) throws -> TrackListModel {
        return TrackListModel(entity: entity)
    }
}

