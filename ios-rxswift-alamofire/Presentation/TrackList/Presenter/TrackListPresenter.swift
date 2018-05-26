//
//  TrackListPresenter.swift
//  ios-rxswift-alamofire
//
//  Created by  on 2018/04/14.
//  Copyright © 2018 . All rights reserved.
//

import Foundation
import RxSwift

protocol TrackListPresenterDelegate :class {
    func setTracks(result: TrackListModel)
    func showErrorMessage()
}

protocol TrackListPresenter {
    func tapSearchButton(artistString: String)
    func errorOccuer()
    func goToNext()
    var trackModelArray: ((_ apiData: Array<TrackModel>?) -> Void)? {get set}
}

final class TrackListPresenterImpl: TrackListPresenter {
    
    let router: TrackListRouter
    let usecase = TrackUseCase(repository: TrackRepositoryImpl())
    private let disposeBag = DisposeBag()
    var trackModelArray: ((_ apiData: Array<TrackModel>?) -> Void)?
    weak var delegate: TrackListPresenterDelegate?
    
    init(router: TrackListRouter) {
        self.router = router
    }
    
    func tapSearchButton(artistString: String) {
        usecase.getTrackList(artist: artistString)
            .subscribe(
                onNext: { [weak self] (element) in
                    self?.trackModelArray?(element.list)
            },
                onError: { [weak self] (error) in
                    self?.errorOccuer()
            })
            .disposed(by: disposeBag)
    }
    
    func errorOccuer(){
        //self.delegate?.showErrorMessage()
    }
    
    func goToNext() {
        //self.router.goToNext()
    }
}

