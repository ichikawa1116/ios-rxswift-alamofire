//
//  TrackDetailPresenter.swift
//  ios-rxswift-alamofire
//
//  Created by  on 2018/05/08.
//  Copyright © 2018 . All rights reserved.
//

import Foundation

protocol TrackDetailPresenter {
    func goToNext()
}

final class TrackDetailPresenterImpl: TrackDetailPresenter {
    let router: TrackDetailRouter
    
    init(router: TrackDetailRouter) {
        self.router = router
    }
    
    func goToNext() {
        self.router.goToNext()
    }
}
